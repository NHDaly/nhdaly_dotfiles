if VERSION >= v"0.7-"
  try
    using REPL, Dates
  catch e
    println("WARNING: $e")
  end
else
  REPL = Base.REPL
end

## Set timestamp and version number in Prompt
#function prompt()
#    timestamp = Dates.format(now(), "HH:MM:SS")
#    return string("($timestamp) julia$(VERSION.major).$(VERSION.minor)> ")
#end
#function customizeprompts(repl)
#    if !isdefined(repl, :interface)
#        repl.interface = REPL.setup_interface(repl)
#    end
#    # prompt prefix function just sets the prompt
#    prefix = repl.interface.modes[1].prompt_prefix
#    repl.interface.modes[1].prompt_prefix = function ()
#        repl.interface.modes[1].prompt = prompt()
#        return (isa(prefix, Function) ? prefix() : prefix)
#    end
#end
#atreplinit(customizeprompts)

try
  import OhMyREPL
  OhMyREPL.input_prompt!(string("julia$(VERSION.major).$(VERSION.minor)>"))
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


include("$(homedir())/dotfiles/nhdaly/nhdaly_utils.jl")
