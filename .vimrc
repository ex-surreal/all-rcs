" Required
set nocompatible

" UTF-8
set encoding=utf-8

" Settings for terminal vim

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
vnoremap <c-s> <esc>:w<cr>
nnoremap <c-s> :w<cr>

" Disable mouse
set mouse=

" Enable local vimrc
set exrc

" Securing the local vimrc's action
set secure

" Show the sign column always
set signcolumn=yes

" Disable auto match highlight
set nohlsearch

" Enable incremental search
set incsearch

" Enable buffer switching even the buffer is dirty
set hidden

" ====================== Common ======================
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

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
set tabstop=4 expandtab softtabstop=4 shiftwidth=4

" Remove swap file
set noswapfile

" Complete option for <C-N>
set complete=.,w,b,u,t

" No automatic end of line
set nofixeol

" Split options
" Navigate easily
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Instinctive split
set splitbelow
set splitright

autocmd BufRead,BufNewFile *.hql :set filetype=sql

" Don't break word while wrapping
set linebreak

" Use the command window
nnoremap : q:i
nnoremap / q/i
nnoremap ? q?i

" Exit if vim-plug is not installed
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 30
autocmd FileType netrw setl bufhidden=delete

" ====================== Plugin ======================
call plug#begin("$HOME/.vim/plugged")

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'

Plug 'itchyny/lightline.vim'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'

Plug 'sonph/onehalf', {'rtp': 'vim/'}

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()            " required

" lightline settings
set laststatus=2
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'onehalfdark',
    \ 'active': {
        \ 'left': [
            \ ['mode', 'paste'],
            \ ['gitbranch'],
            \ ['readonly', 'relativepath', 'modified']
        \ ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
\ }

" Fixing the issue 'delaied jumping to normal mode'
set ttimeoutlen=10
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END

" close-tag settings
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.php,*.tmpl"

" fzf settings
nnoremap <leader>] :GFiles --cached<cr>
nnoremap <leader>[ :Buffer<cr>
nnoremap <leader>p :GFiles?<cr>
nnoremap <leader>\ :Tags<CR>

" Colorscheme
if !empty(globpath(&rtp, 'colors/onehalfdark.vim'))
  colorscheme onehalfdark
endif

" YCM config
let g:ycm_auto_trigger = 0
let g:ycm_always_populate_location_list = 1
let g:ycm_confirm_extra_conf = 0

" For grepping
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
else
    set grepprg=git\ grep\ --cached\ --untracked\ --exclude-standard\ -n\ --no-color
endif

function! s:putInQuickFix(ch, expr)
    caddexpr a:expr
endfunction

function! s:logError(ch, msg)
    echoerr a:msg
endfunction

function! Grep(args, bang)
    let l:cmd = &grepprg . ' ' . a:args
    call setqflist([])
    if exists('g:uc_grep_running_job')
        call job_stop(g:uc_grep_running_job, 'kill')
    endif
    let g:uc_grep_running_job = job_start(['sh', '-c', l:cmd], {
        \ 'out_cb': function('s:putInQuickFix'),
        \ 'err_cb': function('s:logError')
    \ })
    let l:buf = bufwinnr(bufname('%'))
    copen
    if a:bang | execute l:buf . 'wincmd w' | endif
endfunction

function! GrepMotion(type)
    if a:type !=# 'char' | return | endif
    let tmp = @@
    silent exe "normal! `[v`]y"
    call Grep(shellescape(@@), 1)
    let @@ = tmp
endfunction

command! -bang -nargs=+ Grep call Grep(<q-args>, <bang>0)
nnoremap ga :set operatorfunc=GrepMotion<CR>g@

" git-gutter settings
autocmd BufWritePost * if exists(":GitGutter") | GitGutter | endif

augroup Nasm
    autocmd!
    autocmd FileType asm set syntax=nasm
augroup END

function Curl(args, bang)
    let l:cmd = ['sh', '-c', a:args]
    if exists('g:curl_running_job')
        call job_stop(g:curl_running_job, 'kill')
    endif
    let l:buf = bufnr('%')
    if buflisted('curl-out') | bd! curl-out | endif
    silent! vs +set\ buftype=nofile\ ft=json curl-out
    if a:bang | silent! execute 'b ' . l:buf | endif
    let g:curl_running_job = job_start(l:cmd, {
        \ 'err_buf': bufnr('curl-out'),
        \ 'err_io': 'buffer',
        \ 'out_buf': bufnr('curl-out'),
        \ 'out_io': 'buffer'
    \})
endfunction
