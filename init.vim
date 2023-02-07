:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop
:set mouse=a
:set clipboard+=unnamedplus
:set scrolloff=10
:set nohlsearch

call plug#begin()

Plug 'sonph/onehalf'
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'

call plug#end()
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-0> :NERDTreeFocus<CR>

" brackets autocomplete
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

" disable brackets highlighting
let g:loaded_matchparen=1

" use spaces instead of tabs
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab


" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

