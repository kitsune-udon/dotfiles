set nocompatible

set backspace=indent,eol,start

set backup		" keep a backup file
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>


syntax on
set hlsearch

set fenc=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp932
set termencoding=utf-8

set background=dark

set directory=~/.vim/swapfiles
set backupdir=~/.vim/backupfiles
set viminfo+=n~/.vim/.viminfo

set notitle
set number
set showcmd
set ruler

set showmatch
set smartindent
set smartcase
set incsearch

set laststatus=2
set cmdheight=2

set list
set listchars=tab:^\ ,extends:>,precedes:<,trail:~

set expandtab
set shiftwidth=2
set tabstop=2
set smarttab

set splitbelow
set splitright
set sessionoptions+=resize
set previewheight=5

set novisualbell
set noerrorbells

set ambiwidth=double

" Cursor in terminal
" https://vim.fandom.com/wiki/Configuring_the_cursor
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

if &term =~ '^xterm'
  " normal mode
  let &t_EI .= "\<Esc>[2 q"
  " insert mode
  let &t_SI .= "\<Esc>[6 q"
endif
