set nocompatible              " be iMproved, required

source ~/.vim/dotfiles/plugins.vim
source ~/.vim/dotfiles/common.vim

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

" Temp mapping for converting 4-tab to 2-tab
nnoremap <silent> <leader>= :set ts=4 sts=4 noet \| retab! \| set ts=2 sts=2 et \| retab<cr>
