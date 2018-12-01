set nocompatible              " be iMproved, required

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

"Settings for terminal vim

" Use plugin colorscheme
" set background=dark

syntax enable

" Disable arrow keys
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>

" Use <c-s> for saving Required: $ stty -ixon 
inoremap <c-s> <esc>:w<cr>
noremap <c-s> :w<cr>

" Disable mouse
set mouse=

" Enable local vimrc
set exrc

" Securing the local vimrc's action
set secure

" Show the sign column always
set signcolumn=yes

" Syntax start
syntax enable

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

" Show relative line number
set relativenumber

" Indentation
set tabstop=2 expandtab softtabstop=2 shiftwidth=2

" Remove swap file
set noswapfile

" Search options
set nohlsearch
set hidden
set incsearch

" Split options
" Navigate easily
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Instinctive split
set splitbelow
set splitright

" Spell checking
set spell spelllang=en_us

" Don't break words
set linebreak

" Fast spell correction
nnoremap <C-Q> 1z=

" If you use qualified tags, then you have to change iskeyword to include
" a dot.  Unfortunately, that affects a lot of other commands, such as
" w, and \< \> regexes used by * and #.  For me, this is confusing because
" it's inconsistent with vim keys everywhere else.
" This binding temporarily modifies iskeyword just for the ^] command.
nnoremap <silent> <c-]> :setl iskeyword=@,_,.,48-57,39<cr><c-]>
    \:setl iskeyword=@,48-57,_,192-255<cr>

" Exit if vim-plug is not installed 
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer
  endif
endfunction

call plug#begin("$HOME/.vim/plugged")

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'itchyny/lightline.vim'

Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'ex-surreal/vim-action-ack'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'airblade/vim-gitgutter'

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

Plug 'joshdick/onedark.vim'

call plug#end()            " required

" Settings for Nerd Tree
noremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFind<CR>

" Lightline settings
set laststatus=2
set noshowmode
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
    \ 'left': [
      \ ['mode', 'paste'],
      \ ['readonly', 'relativepath', 'modified']
    \ ]
  \ }
\ }

" Fixing the issue 'delayed jumping to normal mode' 
set ttimeoutlen=10
augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
augroup END

" close-tag settings
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.php"

" fzf settings
nnoremap <leader>] :GFiles<cr>
nnoremap <leader>[ :Buffers<cr>
nnoremap <leader>p :GFiles?<cr>
nnoremap <leader>\ :Tags<cr>

" ack settings
let g:ackprg = 'ag --vimgrep'
nnoremap <leader>' :Ack! 

" YCM config
let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list = 1
autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>yf :YcmCompleter FixIt<CR>
autocmd FileType c,cpp nnoremap <buffer><silent> <C-]> :YcmCompleter GoTo<CR>

" Colorscheme
if !empty(globpath(&rtp, 'colors/onedark.vim'))
  colorscheme onedark
endif
