set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'vbe0201/vimdiscord'

set nospell
set smartcase
set nobackup
set noswapfile
set nowritebackup
set wildmenu
set autoindent
set number
set belloff=all
set tabstop=4

" Show the mode you are on the last line.
set showmode

syntax on

set background=dark

colorscheme seashell

