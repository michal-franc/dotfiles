set nocompatible              " be iMproved, required
filetype off                  " required

autocmd BufEnter * silent! lcd %:p:h " automatically sets up the pwd for a file

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'

call vundle#end()            " required
filetype plugin indent on    " required

autocmd VimEnter * NERDTree

imap ii <esc>
set backspace=indent,eol,start
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4

" syntax options
filetype plugin indent on
syntax on