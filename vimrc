""-------- MY ADDITIONS ----------""

" Allow you to save a file that you accidentally opened
" without sudo privelage
cmap w!! %!sudo tee > /dev/null %

" Because who needs vi?
set nocompatible

" set tab stuff 
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set copyindent
set smarttab

set shiftround
" set linebreak "Break lines at word boundaries instead of mid-word
"set nolinebreak "Break lines at word boundaries instead of mid-word

set backspace=indent,eol,start "Allow you to backspace over them
set showmatch "Highlight matching parens

" Don't ignore case for caps
set smartcase "unused unless set ignorecase
set ignorecase

set pastetoggle=<C-Y>
set number "show line numbers. ... duh?
set incsearch "jump to match while typing search

" Hides the current buffer when switching rather than closing
set hidden "Allow leaving unsaved buffers to switch windows

"Set options for formatting text (with autoformat command [=])
set formatoptions=tcqn "autowrap, maintain comments, format comments, lists

set splitbelow "Split windows below the current window.
set splitright "VSplit windows to the right of the current window.

"nnoremap ; : "use ; to mean : so no shift is required

" Set a manual backup directory
"set backup
"set backupdir=~/.vim/backup
"set directory=~/.vim/tmp

set tags=./tags "Where to look for the tags

"set to use search for tags instead of default
noremap <c-]> g<c-]>
noremap <c-LeftMouse> <LeftMouse>g<c-]>

" No more stretching for navigating files  
" Turn off 'h' and shift everything down one
noremap h ;
noremap j h
noremap k gj
noremap l gk
noremap ; l

"Fix up/down for wrapped lines:
" noremap  <buffer> <silent> <Up>   gk
" noremap  <buffer> <silent> <Down> gj
noremap  <buffer> <silent> <Home> g<Home>
noremap  <buffer> <silent> <End>  g<End>
" inoremap <buffer> <silent> <Up>   <C-o>gk
" inoremap <buffer> <silent> <Down> <C-o>gj
inoremap <buffer> <silent> <Home> <C-o>g<Home>
inoremap <buffer> <silent> <End>  <C-o>g<End>



"-- Spelling Corrections --"
iab teh the
iab Teh The



" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Jul 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position in bottom right all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " TODO THIS SHOULDN'T NEED TO BE TURNED OFF. I MESSED SOMETHING UP
  " For all text files set 'textwidth' to 78 characters.
  "autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

