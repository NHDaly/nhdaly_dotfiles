
function move_to_end_of_buffer() {
  last_cursor=$CURSOR
  zle .vi-forward-blank-word-end
  while [[ $CURSOR != $last_cursor ]] ; do
    last_cursor=$CURSOR
    zle .vi-forward-blank-word-end
  done
}

function clear_buffer() {
  move_to_end_of_buffer
  last_cursor=$CURSOR
  zle .backward-kill-word
  while [[ $CURSOR != $last_cursor ]] ; do
    last_cursor=$CURSOR
    zle .backward-kill-word
  done
}

function vi-history-search-backward() {
  start_search
  search_buffer
}
zle -N vi-history-search-backward
#bindkey -v "" vi-history-search-backward-nhdaly

word=
original_buffer=

start_search() {
  original_buffer=$BUFFER
  #zle push-line
  #BUFFER=$original_buffer
}
end_search() {
  #zle .end-of-history
  #zle .vi-history-search-backward "$word"
  zle redisplay
  word=''
}

quit_search() {
  word=''
  #zle .beginning-of-buffer-or-history
  #zle .end-of-history
  clear_buffer
  BUFFER=$original_buffer
  original_buffer=''
  #zle get-line
}

delete_word() {
  if (( $#word == 0 )) ; then
    quit_search
    return 1
  else
    word=${word:0:-1}
  fi
  return 0
}

search_buffer() {
  zle -R "?"
  key=
  while true
  do
    #get_key key
    #zle get-line # put line back so that if we ctrl-c instead of typing a char it goes back.
    read -k key
    #zle push-line # put line back so that if we ctrl-c it goes back.
    case $key in
      '')  end_search ; return ;;  # enter
      '')  delete_word || return ;;  # delete
      '')  quit_search ; return ;;  # ctrl-c
      '')  quit_search ; return ;;  # ctrl-c (if read -k is interrupted)
      #'OD') move_left ;;
      *)     word=$word$key
    esac

    # TOOD(nhdaly): Instead of going to end, just go back one line in history
    #zle .end-of-history
    clear_buffer
    BUFFER=$original_buffer
    zle .vi-history-search-backward "$word"
    zle redisplay

    zle -R '? '$word

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
  done
}

_key()
{
  local kp
  ESC=$'\e'
  _KEY=
  read -k _KEY
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

  printf -v "${1:-key}" "%s" "$key"
}

ord() {
  LC_CTYPE=C printf '%d' "$1"
}

