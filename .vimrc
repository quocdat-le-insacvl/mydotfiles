" Basic Vim settings
set nocompatible              " Use Vim defaults instead of 100% vi compatibility
set mouse=a                   " Enable mouse support in all modes
set encoding=utf-8            " Use UTF-8 encoding
set number relativenumber     " Show line numbers (absolute for current line, relative for others)
set ruler showcmd             " Show cursor position and partial command in status line
set incsearch                 " Show match for partly typed search command
set shellslash                " Use forward slashes in file names; required for Windows
set autoindent smartindent    " Enable auto and smart indenting
set expandtab tabstop=2 shiftwidth=2 softtabstop=2     " Use spaces instead of tabs, with 2 spaces per tab
set foldmethod=syntax foldnestmax=1  " Enable syntax folding with a maximum of one nested fold
set backspace=indent,eol,start  " Allow backspacing over autoindent, line breaks, and start of insert
set cino+=L0                  " Align C++ scope declarations to the left
set belloff=all               " Turn off all error bells
set clipboard=unnamedplus     " Use the system clipboard for all operations
set undofile                  " Maintain undo history between sessions
set title                     " Set the window's title, reflecting the file currently being edited
set nojoinspaces              " Use only one space after '.' when joining lines
set autoread                  " Automatically read file when it has been changed outside of Vim
set updatetime=200            " Reduce update time for faster response (default is 4000ms)

" Plugin Management
call plug#begin()
" UI Plugins
Plug 'vim-airline/vim-airline'        " Enhanced status/tabline
Plug 'vim-airline/vim-airline-themes' " Themes for vim-airline
Plug 'altercation/vim-colors-solarized'  " Solarized color scheme

" Editor Plugins
Plug 'tpope/vim-dispatch'             " Asynchronous build and test dispatcher
Plug 'preservim/nerdcommenter'        " Easy code commenting
Plug 'jiangmiao/auto-pairs'           " Insert or delete brackets, parens, quotes in pair
Plug 'tpope/vim-sleuth'               " Automatically adjusts 'shiftwidth' and 'expandtab'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clangd-completer --go-completer --rust-completer --ts-completer' }  " Code-completion engine
Plug 'rdnetto/ycm-generator', { 'branch': 'stable' }  " Generates config files for YouCompleteMe
Plug 'tpope/vim-fugitive'             " Git wrapper
Plug 'airblade/vim-gitgutter'         " Shows git diff in the sign column
Plug 'editorconfig/editorconfig-vim'  " EditorConfig plugin for Vim

" Navigation Plugins
Plug 'scrooloose/nerdtree'            " File system explorer
Plug 'junegunn/fzf'                   " Fuzzy finder
Plug 'junegunn/fzf.vim'               " Fuzzy finder Vim integration

" Language Specific Plugins
Plug 'octol/vim-cpp-enhanced-highlight'  " Enhanced C++ syntax highlighting
Plug 'dense-analysis/ale'             " Asynchronous Lint Engine
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }  " Python code folding

" Note Taking
Plug 'vimwiki/vimwiki'                " Personal wiki for Vim

call plug#end()

" Theme Settings
let g:solarized_termcolors=256        " Use 256 colors for Solarized theme
set background=light                  " Use light background
colorscheme solarized                 " Set color scheme to Solarized

" Syntax and Filetype Settings
syntax on                             " Enable syntax highlighting
filetype plugin indent on             " Enable filetype detection, plugins, and indentation
autocmd BufRead,BufNewFile *.sage,*.pyx,*.spyx set filetype=python  " Set filetype for specific extensions

" Key Mappings
" Auto-complete curly braces and put cursor inside
inoremap {<CR>  {<CR>}<Esc>O
" Auto-complete empty curly braces
inoremap {}     {}
" Map 'jk' to Escape in insert mode
imap jk         <Esc>
" Map Ctrl+A to select all text
map <C-a> <esc>ggVG<CR>
" Copy to clipboard
map <C-c> y                           
set belloff=all

" Function Key Mappings
" Open testfile in vertical split
map <silent> <F2> <Esc> :vsplit testfile<CR>  
" Open solution.cpp in vertical split
map <silent> <F3> :vsplit solution.cpp<CR>    
" Save and run Python script
map <silent> <F5> <Esc>:w<CR>:!clear<CR>:!python3 main.py<CR>  
" Save and compile C++ file
autocmd filetype cpp nnoremap <F9> :w <bar> Make <CR>  
" Run compiled C++ program
autocmd filetype cpp nnoremap <F10> :vertical terminal ++shell ++cols=40 ./%:r<CR>  
" Run custom script and open result
autocmd filetype cpp nnoremap <F11> :w <bar> !~/scripts/run_expander.sh % <Enter><bar> :tabe combined.cpp<CR>  

" C++ Specific Settings
" Set make program for C++
set makeprg=g++\ -static\ -DDEBUG\ -lm\ -s\ -x\ c++\ -Wall\ -Wextra\ -O2\ -std=c++17\ -I\ ~/mycp/ac-library\ -o\ %:r\ %  

" Load template for new C++ files
"autocmd BufNewFile *.cpp 0r /home/jayleeds/vimcp/Library/Template.cpp  

" LaTeX Settings

" Disable parenthesis matching for LaTeX files
autocmd FileType tex :NoMatchParen    

" Set text width to 110 for LaTeX files
autocmd FileType tex :set tw=110      

" Plugin-specific Settings
" AutoPairs
let g:AutoPairsFlyMode = 0            " Disable fly mode for AutoPairs
let g:AutoPairsWildClosedPair = ''    " Disable wild closed pair
let g:AutoPairsMultilineClose = 0     " Disable multiline close

" Closetag
let g:closetag_emptyTags_caseSensitive = 1  " Make empty tags case-sensitive
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }                               " Set regions for Closetag plugin
let g:closetag_shortcut = '>'         " Set shortcut for closing tags
let g:closetag_close_shortcut = '<leader>>'  " Set shortcut for closing tags with leader key

" NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |  quit | endif  " Close Vim if NERDTree is the only window left
nnoremap <leader>n :NERDTreeFocus<CR>  " Focus NERDTree
nnoremap <C-n> :NERDTree<CR>           " Open NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>     " Toggle NERDTree
nnoremap <C-f> :NERDTreeFind<CR>       " Find current file in NERDTree

" NERD Commenter
let g:NERDSpaceDelims = 1             " Add spaces after comment delimiters by default
let g:NERDTrimTrailingWhitespace = 1  " Enable trimming of trailing whitespace when uncommenting
let g:NERDCommentEmptyLines = 1       " Allow commenting and inverting empty lines
let g:NERDToggleCheckAllLines = 1     " Enable NERDCommenterToggle to check all selected lines is commented or not
" Map Ctrl+/ to comment/uncomment
nmap <C-_> <Plug>NERDCommenterToggle  
" Map Ctrl+/ to comment/uncomment in visual mode
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv  

" Clipboard Configuration for WSL
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" Terminal Cursor Settings
if &term =~ "xterm\\|rxvt"
  " Set cursor color to orange in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"   
  " Set cursor color to red in normal mode
  let &t_EI = "\<Esc>]12;red\x7"      
  " Set initial cursor color to red
  silent !echo -ne "\033]12;red\007"  
  " Reset cursor color on exit
  autocmd VimLeave * silent !echo -ne "\033]112\007"  
endif

