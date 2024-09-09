set scroll=10
set scrolloff=10
set number
set relativenumber
set autoindent
set smarttab
set mouse=a
set clipboard+=unnamedplus
set nohlsearch
" No empty column on left
set scl=no
" Disable line wrapping
set wrap!
" Incremental search on
set incsearch

" Use spaces instead of tabs
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab

" Set <SPACE> as leader key
nnoremap <SPACE> <Nop>
let mapleader = " "

" Toggle highlighted search
nnoremap <leader>s :set hls!<CR>

" Move selected block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Cursor stays at the beggining when J
nnoremap J mzJ`z

" p doesn't copy selected text
xnoremap p pgvy

" Splits navigation
nmap <leader>k :wincmd k<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>h :wincmd h<CR>
nmap <leader>l :wincmd l<CR>

" Tab navigation
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <leader>0 :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <leader>0 :exe "tabn ".g:lasttab<cr>


" Hide Status Line
autocmd BufRead,BufNewFile * set laststatus=0

" Append template to new C++ files
autocmd BufNewFile *.cpp 0r /home/madzin/cp-utils/templates/template.cpp

