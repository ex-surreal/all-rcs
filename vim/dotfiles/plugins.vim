call plug#begin("$HOME/.vim/plugged")

Plug 'altercation/vim-colors-solarized'
Plug 'Valloric/YouCompleteMe' 
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'majutsushi/tagbar'
Plug 'craigemery/vim-autotag'
Plug 'shawncplus/phpcomplete.vim'

call plug#end()            " required

" Plugin settings
colorscheme solarized

let g:ycm_confirm_extra_conf = 0
set completeopt-=preview
let g:ycm_add_preview_to_completeop = 0
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>']

" Settings for Nerd Tree
map <C-n> :NERDTreeToggle<CR>

" Extra Settings
let g:EclimCompletionMethod = 'omnifunc'

" Airline settings
set laststatus=2

" Fixing the issue 'delaied jumping to normal mode' 
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

