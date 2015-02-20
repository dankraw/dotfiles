" safety reasons
set nocompatible

" syntax highlighting
syntax on
" json syntax
autocmd BufNewFile,BufRead *.json set ft=javascript

" better command-line completion
set wildmenu

" cursor position in the status line
set ruler

" use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" keep the same indent as the current line
set autoindent
filetype plugin indent on

" indentation - spaces instead of tabs
set expandtab
set softtabstop=4
set shiftwidth=4

" line numbers on the left
set number
" colors
hi LineNr ctermfg=2

" always display status line
set laststatus=2
" colors
hi StatusLine ctermfg=0 ctermbg=2

" enable mouse
set mouse=a

" backspace
set backspace=indent,eol,start

