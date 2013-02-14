" Vundle and plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Snipmate and its numerous dependencies
Bundle 'honza/snipmate-snippets'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'

" Snipmate configs
let g:snips_trigger_key='<c-space>'
let g:snips_trigger_key_backwards='<s-c-space>'

" YouCompleteMe
let g:ycm_key_list_select_completion=['<Tab>']
let g:ycm_key_list_previous_completion=['<S-Tab>']

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'
Bundle 'Townk/vim-autoclose'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Townk/vim-autoclose'
Bundle 'vim-scripts/taglist.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'duganchen/vim-soy'
Bundle 'Valloric/YouCompleteMe'
Bundle 'rstacruz/sparkup'

filetype plugin indent on

" Personal settings
set number
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
inoremap <C-z> <C-o>u
nnoremap <C-z> u
inoremap <C-y> <C-o><C-r>
nnoremap <C-y> <C-r>

" Map window jumping keys
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Cap Y yanks to EOL
map Y y$

" Quit with q, record with Q
noremap Q q
noremap q <Nop>
noremap <silent> <leader>q :q<cr>

" Delete trailing whitespace
" removes trailing spaces of python files
" (and restores cursor position)
autocmd BufWritePre *.{py,js,protao,hs} mark z | %s/ *$//e | 'z

" Redraw screen
nnoremap <F5> :redr!<CR>

" I only ever want to look in my buffers, usually
let g:ctrlp_cmd = 'CtrlPBuffer'
