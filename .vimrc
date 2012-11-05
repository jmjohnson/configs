" Vundle and plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'
Bundle 'Townk/vim-autoclose'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'

filetype plugin indent on

" Personal settings
set number
set softtabstop=2
set tabstop=2
set smartcase
set incsearch
set hlsearch
set mouse=a
" set guifont=Liberation\ Mono\ 10

nnoremap / /\v
nnoremap <Space> :nohlsearch<CR><Space>

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

" Save/Quit/Copy/Paste
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

" Delete trailing whitespace
" removes trailing spaces of python files
" (and restores cursor position)
autocmd BufWritePre *.py mark z | %s/ *$//e | 'z
