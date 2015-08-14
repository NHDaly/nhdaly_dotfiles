#function vi_mode_nhdaly_prompt_info() {
#  zle -N end-of-line
#  echo "NHDALY"
#  vi_mode_prompt_info
#}

#function zle-isearch-update() {
#  echo "hi"
#}
#zle -N zle-isearch-update

SEARCHING=false
word=

zle -A self-insert save-self-insert

self_insert_exits() {
  zle accept-line
}
self_insert_searches() {
  zle vi-history-search-backward
}

line_init_exits() {
  zle accept-line
}
line-init-user() {
  end_search
  #zle accept-line
  #exit
}
zle -N zle-line-init line-init-user

start_search() {
  zle -A self-insert save-self-insert
  zle -N self-insert self_insert_searches
  zle -N zle-line-init line_init_exits
}
end_search() {
  word=''
  zle -A save-self-insert self-insert
  zle -N zle-line-init line-init-user
}

trap ctrl_c INT

function ctrl_c() {
  echo "** Trapped CTRL-C"
  end_search
}


function vi-history-search-backward() {
  #echo "NHDALY: '$@'"
  SEARCHING=true
  #zle .vi-history-search-backward "$@"
  #zle .history-incremental-search-backward "$@"
  start_search
  search_buffer
  #zle -D zle-line-init
  #zle -N self-insert .self-insert

  #zle 
}
zle -N vi-history-search-backward

search_buffer() {
  echo -n "\n? "
  #get_key
  key=
  #while read -k key
  #do
  read -k key
    case $key in
      '')  end_search ; return ;;  # enter
      '')  word=${word:0:-1} ; echo -n '\r'$word'    ' ;;  # delete
      '')  end_search ; echo '^C!' ;;  # delete
      *)     word=$word$key
    esac

    #echo -n '\r? '$word
    echo -n '\r? '$word

    zle .vi-history-search-backward "$word"
    #zle infer-next-history
    #zle push-line
    #zle get-line
    #zle clear-screen
    #zle redisplay
    #zle reset-prompt
    #zle recursive-edit
    #zle redisplay
    #zle accept-and-infer-next-history
    #zle .history-incremental-search-backward "$word"
  #done
}

#function self-insert() {
#  if [[ SEARCHING == true ]] ; then
#    echo "SEARCHING: '$@'"
#  else
#    zle .self-insert "$@"
#  fi
#}
#zle -N self-insert
#
#function self-insert-unmeta() {
#  if [[ SEARCHING == true ]] ; then
#    echo "SEARCHING: '$@'"
#  fi
#  echo "self-insert-unmeta: '$@'"
#  zle .self-insert-unmeta "$@"
#}
#zle -N self-insert-unmeta
#
#function quoted-insert() {
#  if [[ SEARCHING == true ]] ; then
#    echo "SEARCHING: '$@'"
#  fi
#  echo "quoted-insert: '$@'"
#  zle .quoted-insert "$@"
#}
#zle -N quoted-insert
#
#function vi-quoted-insert() {
#  if [[ SEARCHING == true ]] ; then
#    echo "SEARCHING: '$@'"
#  fi
#  echo "vi-quoted-insert: '$@'"
#  zle .vi-quoted-insert "$@"
#}
#zle -N vi-quoted-insert
#function zle() {
#  #echo "NHDALY-zle"
#  builtin zle "$@"
#}

_key()
{
  local kp
  ESC=$'\e'
  _KEY=
  read -k _KEY
  echo "_KEY: '$_KEY'"
  case $_KEY in
    "$ESC")
        while read -k kp
        do
          _KEY=$_KEY$kp
          case $kp in
            [a-zA-NP-Z~]) break;;
          esac
        done
    ;;
  esac
  printf -v "${1:-_KEY}" "%s" "$_KEY"
}
 
get_key() {
  _key x

  echo "_key: '$_key'"

  case $x in
    $'\e[11~' | $'\e[OP') key=F1 ;;
    $'\e[12~' | $'\e[OQ') key=F2 ;;
    $'\e[13~' | $'\e[OR') key=F3 ;;
    $'\e[14~' | $'\e[OS') key=F4 ;;
    $'\e[15~') key=F5 ;;
    $'\e[16~') key=F6 ;;
    $'\e[17~') key=F7 ;;
    $'\e[18~') key=F8 ;;
    $'\e[19~') key=F9 ;;
    $'\e[20~') key=F10 ;;
    $'\e[21~') key=F11 ;;
    $'\e[22~') key=F12 ;;
    $'\e[A' ) key=UP ;;
    $'\e[B' ) key=DOWN ;;
    $'\e[C' ) key=RIGHT ;;
    $'\e[D' ) key=LEFT ;;
    ?) key=$x ;;
    *) key=??? ;;
  esac

  echo "You have pressed $key"
  export _pressed_key=$key
}
