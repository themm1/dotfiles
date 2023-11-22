:set scroll=10
:set number
:set relativenumber
:set autoindent
:set smarttab
:set softtabstop
:set mouse=a
:set clipboard+=unnamedplus
:set scrolloff=10
:set nohlsearch

call plug#begin()

Plug 'sonph/onehalf'
Plug 'rakr/vim-one'
Plug 'preservim/nerdtree'
Plug 'olimorris/onedarkpro.nvim'
Plug 'declancm/cinnamon.nvim'

call plug#end()

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-0> :NERDTreeFocus<CR>

" use spaces instead of tabs
set tabstop     =8
set softtabstop =8
set shiftwidth  =8
set expandtab

" Hide Status Line
autocmd BufRead,BufNewFile * set laststatus=0

" Append template to new C++ files
autocmd BufNewFile *.cpp 0r /home/madzin/code/cp-utils/other/template.cpp

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif


