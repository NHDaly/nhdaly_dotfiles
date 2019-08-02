module NHDalyUtils

module_functions(modname) =
    [name
     for name in names(modname)
     if typeof(eval(name)) == Function]


macro dumpexpr(e)
    :(dump($(QuoteNode(e))))
end

func_all_specializations(f) =
    Dict(s.sig => s
     for m in methods(f).ms
     for s in Channel() do ch; s = m.specializations; while s isa Core.TypeMapEntry; put!(ch, s) ; s=s.next end end)

func_all_backedges(f) =
    union(
        Dict(:MethodTable => try methods(f).mt.backedges catch ; [] end),
        Dict(k => try s.func.backedges catch ; [] end
            for (k,s) in func_all_specializations(f)),
    )

end


import .NHDalyUtils: @dumpexpr
