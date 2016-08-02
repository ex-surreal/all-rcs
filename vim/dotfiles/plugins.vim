call plug#begin("$HOME/.vim/plugged")

Plug 'altercation/vim-colors-solarized'
Plug 'Valloric/YouCompleteMe', {'for': ['python', 'cpp', 'java']}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'

call plug#end()            " required

" Plugin settings
let g:ycm_confirm_extra_conf = 0
set completeopt-=preview
let g:ycm_add_preview_to_completeop = 0

" Settings for Nerd Tree
map <C-n> :NERDTreeToggle<CR>

" Extra Settings
let g:EclimCompletionMethod = 'omnifunc'


