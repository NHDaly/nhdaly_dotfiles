macro _replace_callback(callback, newval)
  quote
      tmp = $callback
      $callback = (args...)->(tmp(args...), $newval(args...))
  end
end

try
  import OhMyREPL
  OhMyREPL.output_prompt!(">>")
  OhMyREPL.BracketInserter.enable_autocomplete_brackets(false)

  # Set version number in prompt
  in_prompt = "julia$(Int(VERSION.major)).$(Int(VERSION.minor))>"
  OhMyREPL.input_prompt!(in_prompt)

  # Set time in prompt:
  set_time_in_prompt(_...) = OhMyREPL.input_prompt!("($(Dates.format(Dates.now(), "HH:MM:SS"))) $in_prompt")
  set_time_in_prompt()
  #   Update on keypress
  OhMyREPL.add_pass!(OhMyREPL.PASS_HANDLER, "DisplayTime", set_time_in_prompt, true)

  #   Update on Command finished
  #main_mode = Base.active_repl.interface.modes[1]
  #@_replace_callback(main_mode.on_done, set_time_in_prompt)
  #@_replace_callback(main_mode.on_enter, set_time_in_prompt)


catch end
try
  using Revise
catch
  println("Failed to load Revise")
end

include("$(homedir())/dotfiles/nhdaly/nhdaly_utils.jl")
