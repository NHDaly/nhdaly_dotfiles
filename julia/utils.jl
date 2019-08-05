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
struct NotExists end
const notexists = NotExists()
trygetfield(o, f) = try getfield(o, f) catch; notexists end

end


import .NHDalyUtils: @dumpexpr
