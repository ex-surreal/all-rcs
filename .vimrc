set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'Valloric/YouCompleteMe', {'dir': '~/.vim/plugged/YouCompleteMe', 'do': './install.sh --clang-completer --system-clang'}
Plug 'mxw/vim-jsx'
Plug 'jiangmiao/auto-pairs'
Plug 'ex-surreal/buildrc'

call plug#end()            " required

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Syntax start
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Show line number
set number

" Indentation
set tabstop=4 expandtab softtabstop=4 shiftwidth=4

" Remove swap file
set noswapfile

" React settings
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']
