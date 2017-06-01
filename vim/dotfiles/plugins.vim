call plug#begin("$HOME/.vim/plugged")

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'

Plug 'Valloric/YouCompleteMe'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
" Plug 'majutsushi/tagbar'
" Plug 'craigemery/vim-autotag'
Plug 'ex-surreal/vim-std-io'
Plug 'tpope/vim-dispatch'
Plug 'airblade/vim-gitgutter'
" Plug 'vim-syntastic/syntastic'
" Plug 'othree/yajs.vim'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'chemzqm/vim-jsx-improve'
" Plug 'gavocanov/vim-js-indent'
" Plug 'mtscout6/syntastic-local-eslint.vim'

call plug#end()            " required

let g:ycm_confirm_extra_conf = 0
set completeopt-=preview
let g:ycm_add_preview_to_completeop = 0
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>']
let g:ycm_always_populate_location_list = 1

" Settings for Nerd Tree
map <C-n> :NERDTreeToggle<CR>

" Extra Settings
" autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Airline settings
set laststatus=2
let g:airline_theme = 'base16_default'

" Fixing the issue 'delaied jumping to normal mode' 
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

" Allow JSX in normal JS files
" let g:jsx_ext_required = 0

" Syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" let g:syntastic_javascript_checkers = ['eslint']

" close-tag settings
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.php"

" std-io settings
let g:std_io_user_command = {'javascript.jsx': "'node ' . expand('%:p')"}

" Unite keybindings
