" Mapping to Indent a message to set it up for an email reply.
nnoremap <leader>R :call IndentReply()<cr>

function! IndentReply()
  " Set current cursor position.
  normal! mq

  " Make all lines 80-char width.
  execute "normal! ggVGgq"
  " Insert '> ' before each line.
  execute "normal! gg\<c-v>GI> \<esc>"
  " Add a newline at the top.
  execute "normal! ggO\<esc>"

  " Restore original cursor position.
  normal! `q
endfunction

