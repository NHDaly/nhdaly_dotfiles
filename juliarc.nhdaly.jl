if VERSION >= v"0.7-"
  using Pkg
  if "Project.toml" in readdir(".")
    println("Activating project at $(pwd())")
    Pkg.activate(".")
  end
end

try
  import OhMyREPL
  #OhMyREPL.input_prompt!(string("julia$(VERSION.major).$(VERSION.minor)>"))
  OhMyREPL.output_prompt!(">>")
  OhMyREPL.BracketInserter.enable_autocomplete_brackets(false)
catch
end

try
  if VERSION >= v"0.7-"
    @eval using Revise
    # Turn on Revise's automatic-evaluation behavior
    Revise.async_steal_repl_backend()
  else
    using Revise
  end
catch err
  println("Failed to load Revise")
end

