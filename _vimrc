set nocompatible              " be iMproved, required
filetype on
filetype off                  " required

autocmd BufEnter * silent! lcd %:p:h " automatically sets up the pwd for a file

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()

" readt and stable
Plug 'VundleVim/Vundle.vim'
Plug 'dracula/vim'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'

"new plugins testing
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'OmniSharp/omnisharp-vim'
Plug 'OrangeT/vim-csharp'
Plug 'ervandew/supertab'
Plug 'tpope/vim-dispatch'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'moll/vim-node'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'raimondi/delimitmate'
Plug 'kien/ctrlp.vim'
Plug 'plasticboy/vim-markdown'
Plug 'derekwyatt/vim-scala'  
Plug 'Shougo/unite.vim'  
Plug 'elzr/vim-json'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'wincent/command-t'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-sensible'
Plug 'yggdroot/indentline'
Plug 'mhinz/vim-startify'
Plug 'parkr/vim-jekyll'
Plug 'junegunn/goyo.vim'

" test todo plugin http://vimawesome.com/?q=todo

" nice glyphs
Plug 'ryanoasis/vim-devicons'

"snippets
"Plug 'justingj/vim-react-snippets'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

call plug#end()

autocmd! BufWritePost * Neomake
autocmd InsertChange,TextChanged * update | Neomake

" setting leader as space
let mapleader="\<Space>"

set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11

"Airline setting theme
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1

" just to make sure that proper background from theme is used
set background=dark

"jsx plugin
let g:jsx_ext_required=0

" Omnisharp settings
let g:OmniSharp_selector_ui = 'unite'  " Use unite.vim
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1

imap ii <esc>

" enables vim switch pane using CTRL hjkl which is in line with the tmux
" plugin to integrate vim and tmux nicely

nmap <C-J> <C-W>j<C-W>_
nmap <C-K> <C-W>k<C-W>_
nmap <C-H> <C-W>h<C-W>_
nmap <C-L> <C-W>l<C-W>_

" NERDTree show hidden files like .babelrc .gitignore
let NERDTreeShowHidden=1

" open NERDTree automatically
" add shortcut to open NERDTree something like CTRL+TAB NERDTreeToogle
" doesnt work het with startify
" autocmd VimEnter * NERDTree 

" search in unite
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#filters#sorter_default#use(['sorter_rank'])

" ignore certain files and directories while searching
"call unite#custom#source('file,file_rec,file_rec/neovim,grep', 'ignore_pattern', 'bin\|node_modules\|\.git$')
"call unite#custom#source('file,file_rec,file_rec/neovim,grep', 'max_candidates', 50)

"nnoremap <silent> <C-R> :<C-u>UniteWithProjectDir -toggle -auto-resize file_rec/neovim<cr><c-u>
"nnoremap <silent> <C-F> :<C-u>UniteWithProjectDir -toggle -auto-resize grep<cr><c-u>

set backspace=indent,eol,start
set tabstop=2 softtabstop=0 expandtab shiftwidth=2

" syntax ptions
syntax on
filetype plugin indent on

set noswapfile

" enabling line numbers and setting nice color which is non invasive
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

" syntastic
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

augroup END

" Contextual code actions (requires CtrlP or unite.vim)
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

" rename with dialog
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>

" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>
