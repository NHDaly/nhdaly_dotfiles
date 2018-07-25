# Set timestamp and version number in Prompt
function prompt()
    timestamp = Dates.format(now(), "HH:MM:SS")
    workingdirectory = last(splitdir(pwd()))
    return string("($timestamp) julia$(VERSION.major).$(VERSION.minor)> ")
end
function customizeprompts(repl)
    if !isdefined(repl, :interface)
        repl.interface = Base.REPL.setup_interface(repl)
    end
    # prompt prefix function just sets the prompt
    prefix = repl.interface.modes[1].prompt_prefix
    repl.interface.modes[1].prompt_prefix = function ()
        repl.interface.modes[1].prompt = prompt()
        return (isa(prefix, Function) ? prefix() : prefix)
    end
end
atreplinit(customizeprompts)

try
  import OhMyREPL
  OhMyREPL.output_prompt!(">>")
  OhMyREPL.BracketInserter.enable_autocomplete_brackets(false)
catch end

try
  using Revise
catch
  println("Failed to load Revise")
end

include("$(homedir())/dotfiles/nhdaly/nhdaly_utils.jl")
