set nocompatible
filetype off 

call plug#begin()

Plug 'preservim/nerdcommenter'

"Navigation Plugins
Plug 'rbgrouleff/bclose.vim'
Plug 'dbakker/vim-projectroot'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'

"UI Plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'altercation/vim-colors-solarized'

"Editor plugins
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-sleuth'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clangd-completer --go-completer --rust-completer --ts-completer' }
Plug 'rdnetto/ycm-generator', { 'branch': 'stable' }
"Plug 'SirVer/ultisnips'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'Chiel92/vim-autoformat'

"Language specific
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
"Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tikhomirov/vim-glsl'
Plug 'vhdirk/vim-cmake'
Plug 'ds26gte/scmindent'
Plug 'udalov/kotlin-vim'

if isdirectory("~/dev/mitscript-syntax")
  Plug '~/dev/mitscript-syntax'
endif

"Note taking
Plug 'vimwiki/vimwiki'
Plug 'lukaszkorecki/workflowish'

call plug#end()

set encoding=utf-8
"set clipboard+=unnamedplus
set clipboard=nnamed
set number
set foldmethod=syntax
set foldnestmax=1

"------------------------------------------
"---------------NERD Tree------------------
" Start NERDTree and leave the cursor in it
"autocmd VimEnter * NERDTree
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |  quit | endif
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"------------------------------------------

syntax on
filetype plugin indent on
autocmd BufRead, BufNewFile *.sage,*.pyx,*spyx set filetype=python

set backspace=indent,eol,start
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set number
set ruler
set showcmd
set mouse=a
set undofile
set title
set nojoinspaces
set autoread
set updatetime=200


"-----------------------MAKE-----------------------
map <silent> <F4> <Esc>:w<CR>:!make<CR>
map <silent> <F2> <Esc> :vsplit test<CR>
map <silent> <F3> :vsplit solution.cpp<CR>
