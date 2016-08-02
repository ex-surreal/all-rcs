set nocompatible              " be iMproved, required

source ~/.vim/dotfiles/plugins.vim
source ~/.vim/dotfiles/common.vim

"Settings for terminal vim

" Use plugin colorscheme
set background=dark
colorscheme solarized

" Disable arrow keys
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>

" Disable mouse
set mouse=

" Enable local vimrc
set exrc

" Securing the local vimrc's action
set secure
