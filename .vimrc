" Vundle and plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'

filetype plugin indent on

" Personal settings
set number
set softtabstop=2
set tabstop=2
set smartcase
set incsearch
set hlsearch
" set guifont=Liberation\ Mono\ 10

nnoremap / /\v
nnoremap <Space> :nohlsearch<CR><Space>

inoremap <C-S-Left> <C-O>vb
nnoremap <C-S-Left> vb
vnoremap <C-S-Left> b
inoremap <C-S-Right> <C-O>vw
nnoremap <C-S-Right> vw
vnoremap <C-S-Right> w
vnoremap <BS> x

inoremap <C-s> <C-o>:w<CR>
nnoremap <C-s> :w<CR>

nnoremap p gP

" Map window jumping keys
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
