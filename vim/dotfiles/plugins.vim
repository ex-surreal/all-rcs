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
Plug 'w0rp/ale'
Plug 'nicwest/vim-http'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-scripts/Conque-GDB'

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
nnoremap <leader>p :Gfiles?
nnoremap <leader>\ :Tags

" ack settings
let g:ackprg = 'ag --vimgrep'
nnoremap <leader>' :Ack! 
