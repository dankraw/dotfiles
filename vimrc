" safety reasons
set nocompatible

" syntax highlighting
syntax on

" better command-line completion
set wildmenu

" cursor position in the status line
set ruler

" use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" keep the same indent as the current line
set autoindent

" indentation - spaces instead of tabs
set expandtab
set softtabstop=4
set shiftwidth=4

" line numbers on the left
set number
" colors
hi LineNr ctermfg=7

" always display status line
set laststatus=2
" colors
hi StatusLine ctermfg=0 ctermbg=4

" enable mouse
set mouse=a
