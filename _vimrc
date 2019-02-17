set nocompatible              " be iMproved, required
filetype on
filetype off                  " required

autocmd BufEnter * silent! lcd %:p:h " automatically sets up the pwd for a file

" set the runtime path to include Vundle and initialize

call plug#begin('~/.vim/plugged')

" ready and stable
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/goyo.vim'
Plug 'pangloss/vim-javascript'
Plug 'vim-syntastic/syntastic'

" testing new
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'rust-lang/rust.vim'
Plug 'kien/ctrlp.vim'

" nice glyphs
" Plug 'ryanoasis/vim-devicons'

"new plugins testing
"Plug 'airblade/vim-rooter'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
"Plug 'shougo/vimproc.vim', {'do' : 'make'}
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-session'
"Plug 'OrangeT/vim-csharp'
"Plug 'ervandew/supertab'
"Plug 'tpope/vim-dispatch'
"Plug 'moll/vim-node'
"Plug 'majutsushi/tagbar'
"Plug 'scrooloose/nerdcommenter'
"Plug 'easymotion/vim-easymotion'
"Plug 'tpope/vim-repeat'
"Plug 'raimondi/delimitmate'
"Plug 'plasticboy/vim-markdown'
"Plug 'derekwyatt/vim-scala'  
"Plug 'Shougo/unite.vim'  
"Plug 'elzr/vim-json'
"Plug 'tpope/vim-fugitive'
"Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'
"Plug 'jistr/vim-nerdtree-tabs'
"Plug 'wincent/command-t'
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'tpope/vim-sensible'
"Plug 'yggdroot/indentline'
"Plug 'mhinz/vim-startify'
"Plug 'parkr/vim-jekyll'

" test todo plugin http://vimawesome.com/?q=todo

"snippets
"Plug 'justingj/vim-react-snippets'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

"Not working yet
"Plug 'OmniSharp/omnisharp-vim'

call plug#end()

" autocmd! BufWritePost * Neomake
" autocmd InsertChange,TextChanged * update | Neomake

" setting leader as space
let mapleader="\<Space>"

set encoding=utf8
set guifont=Monoscape:h11

"Airline setting theme
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1

" just to make sure that proper background from theme is used
set background=dark

"jsx plugin
let g:jsx_ext_required=0

imap kk <esc>

set clipboard=unnamedplus

" enables vim switch pane using CTRL hjkl which is in line with the tmux
" plugin to integrate vim and and i3wm 

nnoremap <silent> <c-l> :call Focus('right', 'l')<CR>
nnoremap <silent> <c-h> :call Focus('left', 'h')<CR>
nnoremap <silent> <c-k> :call Focus('up', 'k')<CR>
nnoremap <silent> <c-j> :call Focus('down', 'j')<CR>

" NERDTree show hidden files like .babelrc .gitignore
let NERDTreeShowHidden=1

" open NERDTree automatically
" add shortcut to open NERDTree something like CTRL+TAB NERDTreeToogle
" doesnt work het with startify
" autocmd VimEnter * NERDTree 

set backspace=indent,eol,start
set tabstop=2 softtabstop=0 expandtab shiftwidth=2

" syntax ptions
syntax on
filetype plugin indent on

set noswapfile

" enabling line numbers and setting nice color which is non invasive
set number relativenumber
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

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)

"golint
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

"ctrlp
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_root_markers = ['.ctrlp']

let g:rooter_patterns = ['Rakefile', '.git/', 'DockerFile']
" dont spam echo
let g:rooter_silent_chdir = 1
"worth adding?
"https://github.com/junegunn/fzf.vim/issues/123

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
