call plug#begin("$HOME/.vim/plugged")

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'

Plug 'Valloric/YouCompleteMe'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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
Plug 'vim-syntastic/syntastic'

call plug#end()            " required

let g:ycm_confirm_extra_conf = 0
set completeopt-=preview
let g:ycm_add_preview_to_completeop = 0
let g:ycm_key_list_select_completion = ['<TAB>', '<C-n>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<C-p>']
let g:ycm_always_populate_location_list = 1

" Settings for Nerd Tree
noremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFind<CR>

" Airline settings
set laststatus=2
let g:airline_theme = 'base16_default'

" Fixing the issue 'delayed jumping to normal mode' 
set ttimeoutlen=10
augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
augroup END

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" close-tag settings
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.php"

" fzf settings
nnoremap <leader>] :GFiles<cr>
nnoremap <leader>[ :Buffers<cr>
nnoremap <leader>p :Gfiles?
nnoremap <leader>\ :Tags

" ack settings
let g:ackprg = 'ag --vimgrep'
nnoremap <leader>' :Ack! 
