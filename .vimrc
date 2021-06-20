set nocompatible
"filetype off
filetype plugin on

call plug#begin()

" Web development
Plug 'mattn/emmet-vim'  
" https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'dense-analysis/ale'
Plug 'alvan/vim-closetag'

Plug 'APZelos/blamer.nvim'
Plug 'justinmk/vim-syntax-extra'
Plug 'preservim/nerdcommenter'
Plug 'StanAngeloff/php.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'

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
set number
set foldmethod=syntax
set foldnestmax=1


syntax on
filetype plugin indent on
autocmd BufRead, BufNewFile *.sage,*.pyx,*spyx set filetype=python

set backspace=indent,eol,start
set autoindent
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
map <silent> <F2> <Esc> :vsplit testfile<CR>
map <silent> <F3> :vsplit solution.cpp<CR>
map <silent> <F5> <Esc>:w<CR>:!clear<CR>:!python3 main.py<CR>


"-------COPY_CLIPBOARD----------------------------
set clipboard=unnamedplus

"------TURN OFF FLY MODE PAIR -----------
let g:AutoPairsFlyMode=0 
let g:AutoPairsWildClosedPair = ''
let g:AutoPairsMultilineClose = 0
let g:AutoPairsWildClosedPair = 0


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

"--- Enable git blamer
"let g:blamer_enabled = 1
"
 
" web 
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

  
  
"Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"Disable autopairs for html file
au Filetype html let b:autopairs_enabled = 0
au Filetype html let b:AutoPairs={'<':'<'}

