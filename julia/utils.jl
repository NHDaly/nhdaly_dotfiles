module NHDalyUtils

module_functions(modname) =
    [name
     for name in names(modname)
     if typeof(eval(name)) == Function]


macro dumpexpr(e)
    :(dump($(QuoteNode(e))))
end

"""
    func_all_specializations(f)

List all the specializations of a function, if there are any.
"""
func_all_specializations(f) =
    Dict(s.sig => s
     for m in methods(f).ms
     for s in Channel() do ch; s = m.specializations; while s isa Core.TypeMapEntry; put!(ch, s) ; s=s.next end end)

"""
    func_all_backedges(f)

List all the backedges on all specializations of a function, if there are any.
"""
func_all_backedges(f) =
    Dict(
        :MethodTable => try methods(f).mt.backedges catch ; [] end,
        (k => try s.func.backedges catch ; [] end
         for (k,s) in func_all_specializations(f))...
    )

# MODULE stuff
module_all_globals(m) =
    [n for n in names(m, all=true)
        if try
            String(n)[1] != '#' &&
            !isa(Core.eval(m, n), Union{DataType, Function, Module})
        catch
            false
        end]

issubmodule(m::Module, s::Symbol) =
    isdefined(m, s) && isa(Core.eval(m,s), Module) && nameof(m) != s
#issubmodule(m::Module, s::Module) = issubmodule(m, nameof(s))
submodules(m) = Module[Core.eval(m, x) for x in filter(x->issubmodule(m,x), names(m, all=true))]
recursive_submodules(m) = collect(Iterators.flatten(
    [x, recursive_submodules(x)...]
        for x in submodules(m)
    ))

module_recursive_globals(m) =
    Dict(
        sm => names
        for sm in recursive_submodules(m)
        for names in (module_all_globals(sm),)
        if !isempty(names)
    )
module_recursive_globals_const(m) =
    Dict(
        sm => names
        for sm in recursive_submodules(m)
        for names in ([n for n in module_all_globals(sm) if isconst_global(sm, n)], )
        if !isempty(names)
    )
module_recursive_globals_nonconst(m) =
    Dict(
        sm => names
        for sm in recursive_submodules(m)
        for names in ([n for n in module_all_globals(sm) if !isconst_global(sm, n)], )
        if !isempty(names)
    )

struct _Binding_t
    name::Ptr{Nothing}
    value::Ptr{Nothing}
    globalref::Ptr{Nothing}
    owner::Ptr{Nothing}
    constp::Bool
end

function getbinding(m, s)
    p = ccall(:jl_get_binding, Ptr{_Binding_t}, (Any, Any), m, s)
    p == Ptr{Nothing}(0) ? nothing : unsafe_load(p)
end

function isconst_global(m::Module, s::Symbol)
    b = getbinding(m,s)
    b != nothing && b.constp
end

module_recursive_globals_const_mutable(m) =
    Dict(
        sm => names
        for sm in recursive_submodules(m)
        for names in ([n for n in module_all_globals(sm)
                        if isconst_global(sm, n) &&
                            try
                                v = @eval sm $n
                                isconcretetype(typeof(v)) && !isimmutable(v) && !isa(v, Union{String, Symbol})
                            catch ; false end],)
        if !isempty(names)
    )

"""
    diff_fields(a,b)

Returns a Dict(:field => (a.field, b.field)) for each field present in both a and b that
have different values.
"""
diff_fields(a,b) =
    Dict(field => (af, bf)
            for field in propertynames(a)
            for af in (trygetfield(a, field),)
            for bf in (trygetfield(b, field),)
            if field in propertynames(b) && af != bf
        )
diff_fields(a::Array, b::Array) =
    Dict(idx => (af, bf)
            for idx in 1:max(length(a), length(b))
            for af in [get(a, idx, nothing)]
            for bf in [get(b, idx, nothing)]
            if af != bf
        )


struct NotExists end
const notexists = NotExists()
trygetfield(o, f) = try getfield(o, f) catch; notexists end

end


import .NHDalyUtils: @dumpexpr
