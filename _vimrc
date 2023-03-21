syntax on

set nu

if has('gui_running')
        :set guicursor+=a:blinkon0
        :set lines=55
        :set columns=100
        :winpos 200 50
        if has('gui_win32')
                set guifont=Consolas:h9
        endif
endif

if !has('gui_running')
        let &t_SI = "\e[6 q"
        let &t_EI = "\e[2 q"
        augroup myCmds
        au!
        autocmd VimEnter * silent !echo -ne "\e[2 q"
        augroup END
        set ttimeout
        set ttimeoutlen=1
        set ttyfast
endif

:set bs=2
:set number
:set relativenumber
:set autoindent
:set smarttab
:set mouse=a
:set scrolloff=10
:set nohlsearch
:set smartindent
:set paste
:set clipboard=unnamed

let g:loaded_matchparen=1

:set tabstop     =8
:set softtabstop =8
:set shiftwidth  =8
:set expandtab

