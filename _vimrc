set nocompatible              " be iMproved, required
filetype on
filetype off                  " required

autocmd BufEnter * silent! lcd %:p:h " automatically sets up the pwd for a file

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" readt and stable
Plugin 'VundleVim/Vundle.vim'
Plugin 'dracula/vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'neomake/neomake'
Plugin 'airblade/vim-gitgutter'
Plugin 'xuyuanp/nerdtree-git-plugin'

"new plugins testing
Plugin 'tpope/vim-surround'
Plugin 'moll/vim-node'
Plugin 'majutsushi/tagbar'
" not working Plugin 'scroolloose/nerdcommenter'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-repeat'
" requires python Plugin 'sirver/ultisnips'
" problems installing Plugin 'raimondi/delimmate'
Plugin 'kien/ctrlp.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'derekwyatt/vim-scala'  
Plugin 'Shougo/unite.vim'  
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'wincent/command-t'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-sensible'
Plugin 'yggdroot/indentline'
Plugin 'mhinz/vim-startify'
Plugin 'parkr/vim-jekyll'
Plugin 'junegunn/goyo.vim'

" test todo plugin http://vimawesome.com/?q=todo

" nice glyphs
Plugin 'ryanoasis/vim-devicons'

"snippets
"Plugin 'justingj/vim-react-snippets'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'

call vundle#end()            " required
filetype plugin indent on    " required

autocmd! BufWritePost * Neomake
autocmd InsertChange,TextChanged * update | Neomake

set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11

"Airline setting theme
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1

" just to make sure that proper background from theme is used
set background=dark

"jsx plugin
let g:jsx_ext_required=0

"ident guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

imap ii <esc>

" NERDTree show hidden files like .babelrc .gitignore
let NERDTreeShowHidden=1

" open NERDTree automatically
" doesnt work het with startify
" autocmd VimEnter * NERDTree 

" search in unite
nmap <D-F> unite#custom#source('file_rec/async', 'ignore_pattern', 'node_modules/')?
" so that i support it in the windows too
nmap <C-F> <D-F>

set backspace=indent,eol,start
set tabstop=2 softtabstop=0 expandtab shiftwidth=2

" syntax options
syntax on
filetype plugin indent on

set noswapfile
set number
highlight LineNr ctermfg=239

"you need to specify args eslint default config is broken and doesnt read the
"errors properly
let g:neomake_javascript_eslint_maker = {
    \ 'args':['--no-color', '--format', 'compact'],
    \ 'exe': 'eslint',
    \ 'errorformat': '%f: line %l\, col %c\, %m',
    \ }

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_place_signs= 1
let g:neomake_verbose = 3
