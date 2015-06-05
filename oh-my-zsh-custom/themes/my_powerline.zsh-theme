# my powerline theme

ZSH_PATH="%~"  # Home-relative current path

PATH_LEN=25
_ShortenPath ()
{
    local PRE= NAME="$1" LENGTH="$2";
    [[ "$NAME" != "${NAME#$HOME/}" || -z "${NAME#$HOME}" ]] &&
        PRE+='~' NAME="${NAME#$HOME}" LENGTH=$[LENGTH-1];
    ((${#NAME}>$LENGTH)) && NAME="/…${NAME:$[${#NAME}-LENGTH+4]}";
    echo "$PRE$NAME"
}
PATH='\h:$(_ShortenPath "$ZSH_PATH" $PATH_LEN)\$ '

DATE_FMT=%D{%Y-%m-%d}

PROMPT="$DATE_FMT $PATH $"

# Colors  --  I don't understand this yet...
#if [ $(id -u) -eq 0 ]; then
#    POWERLINE_SEC1_BG=%K{red}
#    POWERLINE_SEC1_FG=%F{red}
#else
#    POWERLINE_SEC1_BG=%K{green}
#    POWERLINE_SEC1_FG=%F{green}
#fi
#POWERLINE_SEC1_TXT=%F{black}
#if [ "$POWERLINE_DETECT_SSH" != "" ]; then
#  if [ -n "$SSH_CLIENT" ]; then
#    POWERLINE_SEC1_BG=%K{red}
#    POWERLINE_SEC1_FG=%F{red}
#    POWERLINE_SEC1_TXT=%F{white}
#  fi
#fi

#PROMPT="$DATE_FMT$POWERLINE_SEC1_BG$POWERLINE_SEC1_TXT %k%f$POWERLINE_SEC1_FG%K{blue}"$'\ue0b0'"%k%f%F{white}%K{blue} "$PATH"%F{blue}"" %k"$'\ue0b0'"%f "

