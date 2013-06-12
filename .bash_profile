
WELCOME_STRINGS={"Hi, Nathan. Welcome back. We missed you.","... Don't leave us again. "}
echo "Hi, Nathan. Welcome back. We missed you."
echo "... Don't ever leave us again."

#Bash History
# ignore duplicated and empty history entries
export HISTCONTROL=ignoreboth


#Bash Prompt
export PROMPT_COMMAND='PS1="$(python ~/short.pwd.py)"'


#ALIASES
alias c++11="clang++ -std=c++11"
alias go='xdg-open'

alias pyScientific="python -i /usr/lib/python2.7/dist-packages/spyderlib/scientific_startup.py"


export PYTHONSTARTUP=~/.pythonrc
export LD_LIBRARY_PATH=/usr/local/lib


