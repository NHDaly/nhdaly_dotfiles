" Replace all the various ={motion} keys to clang-format
nnoremap <buffer> = :set opfunc=codefmt#FormatMap<CR>g@
nnoremap <buffer> == :FormatLines<CR>
vnoremap <buffer> = :FormatLines<CR>
