let g:gofmt_command = "goimports"
set rtp+=$GOROOT/misc/vim
" The following line doesn't really seem to do anything... :(
set shiftwidth=4  " choose a width you like, only necessary as a bug workaround
filetype plugin indent on

" Replace all the various ={motion} keys to golang Fmt
"nnoremap <buffer> = :set opfunc=codefmt#FormatMap<CR>g@
"nnoremap <buffer> == :Fmt<CR>
"vnoremap <buffer> = :Fmt<CR>

