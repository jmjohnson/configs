" Plugins {{{
" Vundle and plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"Plugin 'duganchen/vim-soy'
"Plugin 'mattn/zencoding-vim'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'tpope/vim-speeddating'
"Plugin 'vim-scripts/taglist.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
" Autoclose remaps the spacekey. Search for AutoCloseExpandSpace in the source
" and add a <C-]> to it to make sure it still expands stuff
Plugin 'Townk/vim-autoclose'
Plugin 'tpope/vim-surround'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'

" Google specific configs and their mutually exclusive counterparts.
"if filereadable(expand("~/.at_google.vim"))
  "source ~/.at_google.vim  " Initialize some basic settings.
"else
  "" This plugin needs compilation
  "Plugin 'Valloric/YouCompleteMe'
"endif

call vundle#end()
filetype plugin indent on
" }}}

" YouCompleteMe {{{
let g:ycm_key_list_select_completion=['<Tab>']
let g:ycm_key_list_previous_completion=['<S-Tab>']
let g:ycm_key_invoke_completion=''
" }}}

" Ultisnips {{{
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsListSnippets = "<c-l>"
let g:UltiSnipsSnippetDirectories = ['my_snips', 'UltiSnips']
" Don't forget to symlink ~/.vim/my_snips into configs!
"ino <expr> <CR> firs_func() ? abc() : cde()
" }}}

" Syntastic {{{
" Don't forget to put the python checker in
" ~/.vim/bundle/syntastic/syntax_checkers/...
" I think the above line is usually filled in for company specific linters...
" I'll just set this for now.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
syntax on
" }}}

" Ctrl-P {{{
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_extensions = ['buffertag']
" }}}

" Personal settings {{{
set number
set relativenumber
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smartcase
set incsearch
set title
set wildchar=<Tab> wildmenu wildmode=full
set hlsearch
set mouse=a
set autoindent
set showmode
set showmatch
set autoread
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/
set autochdir " IMPORTANT: Causes some plugins not to work
let mapleader = ","
" set guifont=Liberation\ Mono\ 10

nnoremap / /\v
nnoremap <silent> <Space> :nohl<CR><Space>

" Quick reloading of files
autocmd BufEnter,BufWinEnter,CursorHold filename :checktime

" Hilight text with control arrow keys
inoremap <C-S-Left> <C-O>vb
nnoremap <C-S-Left> vb
vnoremap <C-S-Left> b
inoremap <C-S-Right> <C-O>vw
nnoremap <C-S-Right> vw
vnoremap <C-S-Right> w
vnoremap <BS> x

" Delete current line
nnoremap <C-d> dd

" Use Alt, up/down to move a line of text
inoremap <A-Up> <Esc>VdkPi
inoremap <A-Down> <Esc>Vdpi
nnoremap <A-Up> <Esc>VdkP
nnoremap <A-Down> <Esc>Vdp

" Save/Quit/Copy/Paste/Undo/Redo
inoremap <C-s> <C-o>:w<CR>
nnoremap <C-s> :w<CR>
inoremap <C-q> <C-o>:q<CR>
nnoremap <C-q> :q<CR>
vnoremap <C-c> "+y
nnoremap <C-v> "+p
inoremap <C-v>  <C-o>"+p
vnoremap <C-x> "+x

" Map window jumping keys
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
set splitright

" Cap Y yanks to EOL
map Y y$

" Quit with q, record with Q
noremap Q q
noremap q <Nop>

" Delete trailing whitespace
" removes trailing spaces of python files
" (and restores cursor position)
fun! StripTrailingWS()
  let l = line(".")
  let c = col(".")
  keepjumps %s/\s\+$//e
  keepjumps call cursor(l, c)
endfun

augroup stripws
  autocmd!
  autocmd BufWritePre * :keepjumps call StripTrailingWS()
augroup end

" Redraw screen
nnoremap <F5> :redr!<CR>
" }}}

filetype plugin indent on

" Vimscript file settings --------------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}


