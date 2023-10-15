:set number
:set relativenumber
:set smarttab
:set mouse=a
:set clipboard+=unnamedplus
:set scrolloff=5
:set nohlsearch
:set autoindent
:set smartindent
:set pastetoggle=<F3>
:set scroll=20

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.cpp set expandtab
au BufRead,BufNewFile *.h set expandtab

set expandtab           " enter spaces when tab is pressed
set tabstop=8           " use 4 spaces to represent tab
set softtabstop=8
set shiftwidth=8       " number of spaces to use for auto indent

" make backspaces more powerfull
set backspace=indent,eol,start

" set block cursor in normal mode, normal cursor in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
set ttimeout
set ttimeoutlen=1
set ttyfast

"Append template to new C++ files
autocmd BufNewFile *.cpp 0r /home/madzin/code/cp-utils/other/template.cpp

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

