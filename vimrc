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

" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
if exists('$TMUX')
   " set insert mode to a cyan vertical line   
   let &t_SI .= "\<esc>Ptmux;\<esc>\<esc>[6 q\<esc>\\"
   let &t_SI .= "\<esc>Ptmux;\<esc>\<esc>]12;cyan\x7\<esc>\\"
   " set normal mode to a green block
   let &t_EI .= "\<esc>Ptmux;\<esc>\<esc>[2 q\<esc>\\"
   let &t_EI .= "\<esc>Ptmux;\<esc>\<esc>]12;green\x7\<esc>\\"
   " set replace mode to an orange underscore
   let &t_SR .= "\<esc>Ptmux;\<esc>\<esc>[4 q\<esc>\\"
   let &t_SR .= "\<esc>Ptmux;\<esc>\<esc>]12;orange\x7\<esc>\\"

   " initialize cursor shape/color on startup (silent !echo approach doesn't seem to work for tmux)
   augroup ResetCursorShape
      au!
      "autocmd VimEnter * startinsert | stopinsert
      autocmd VimEnter * normal! :startinsert :stopinsert
      "autocmd VimEnter * :normal :startinsert :stopinsert
   augroup END

   " reset cursor when leaving tmux
   autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[2 q\033\\"
   autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033]12;gray\007\033\\"
endif
