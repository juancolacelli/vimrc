""""""""""""""""""""
" Vim configuration
""""""""""""""""""""
" Source: https://github.com/juancolacelli/vimrc
" Maintainer: Juan Colacelli <http://juan.colacelli.com>

""""""""""""""""""""
" General
""""""""""""""""""""
set nocompatible
set encoding=utf8         " Encoding
set spell                 " Spelling
set spelllang=en          " Spelling languages
set wildmenu              " Terminal autocomplete
set wildmode=list:longest " Long terminal autocomplete

" Indentation
filetype plugin indent on " File type indentation
set autoindent
set copyindent
set expandtab             " Spaces instead of tabs
set preserveindent
set shiftwidth=2          " 2 spaces by indent
set smartindent           " Tabs and spaces are the same
set smarttab              " Start indentation based on the start of the line
set tabstop=2             " 2 spaces by tab

" Search
set hlsearch   " Highlight current search
set ignorecase " Ignore case sensitive
set incsearch  " Incremental search
set smartcase  " Ignore case if search is lowercase

" Backup
set backupdir^=~/.vim/.backup//
set backup

" Swap
set directory^=~/.vim/.swap//
set swapfile

" Edition
set autoread                                  " Auto-reload on change
set confirm                                   " Confirm changes on exit
set colorcolumn=80                            " Right margin
set hidden                                    " Save undo on exit
set history=1000                              " Command history
set joinspaces                                " Join spaces
set linespace=0                               " Remove spaces between lines
set matchpairs=(:),{:},[:],<:>                " Highlight by pairs
set matchtime=10                              " Highlight timer
set number                                    " Show line number
set numberwidth=4                             " Line number max 9999
set relativenumber                            " Show relative line numbers
set showcmd                                   " Show partial commands
set showmatch                                 " Show matching key
set undolevels=1000                           " 1000 undo
set wrap                                      " Cut lines if they exceed right margin

" Beep
set noerrorbells " Visual bell
set visualbell   " Visual bell

" Mouse
set mouse=a   " Mouse enabled
set mousehide " Hide mouse when writing

" General
set backspace=indent,eol,start " Flexible erasing
set more                       " Enable more results

" Remove trailing spaces on save
au BufWritePre * :%s/\s\+$//e

""""""""""""""""""""
" Functions
""""""""""""""""""""
" Middle button pastes
imap <MouseMiddle> <esc>"*p"
nmap <MouseMiddle> <esc>"*p"

""""""""""""""""""""
" Auto-close
""""""""""""""""""""
" Close automatically
:ino ( ()<left>
:ino { {}<left>
:ino [ []<left>
:ino < <><left>
:ino " ""<left>
:ino ' ''<left>

""""""""""""""""""""
" Commands
""""""""""""""""""""
" Common errors
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q
nore ; :
let maplocalleader=',' " Macros start
let mapleader=','      " Macros start
let g:mapleader=','    " Macros start

" Save with sudo
cmap w!! w !sudo tee % >/dev/null

""""""""""""""""""""
" Movement
""""""""""""""""""""
" Window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

""""""""""""""""""""
" Make
""""""""""""""""""""
" F5 make
nno <F5> :w<cr> :silent make<cr>
ino <F5> <Esc>:w<cr>:silent make<cr>
vno <F5> :<C-U>:w<cr>:silent make<cr>

""""""""""""""""""""
" Toggle cases
""""""""""""""""""""
" F6 under_score to camelCase
nno <F6> :%s/_\(\l\)/\u\1/gc<cr>
" Shift F6 camelCase to under_score
nno <S-F6> :%s/\(\l\)\(\u\)/\1\_\l\2/gc<cr>

""""""""""""""""""""
" Fold
""""""""""""""""""""
set foldmethod=indent   " Fold based on indent
set foldnestmax=10      " Deepest fold is 10 levels
set nofoldenable        " Don't fold by default

""""""""""""""""""""
" Colors
""""""""""""""""""""
set background=dark    " Dark background
colorscheme gruvbox    " Color scheme
set cursorline         " Highlight current line
set cursorcolumn       " Highlight current column
set laststatus=2       " Show statusbar
syn on                 " Highlight syntax

if has("gui_running")
  set guioptions-=T  " Disable toolbar
  set guioptions-=R  " Disable right scrollbar
  set guioptions-=r  " Disable right scrollbar
  set guioptions-=L  " Disable left scrollbar
  set transparency=5 " Transparency 5%
endif

""""""""""""""""""""
" .vimrc
""""""""""""""""""""
" Open .vimrc
map <leader>v :e! ~/.vimrc<cr>"

" Reopen .vimrc when saved
au! bufwritepost .vimrc source ~/.vimrc"

""""""""""""""""""""
" Minpac (packages)
""""""""""""""""""""
if exists('*minpac#init')
  call minpac#init()

  " Autocomplete
  call minpac#add('Shougo/neocomplete.vim')

  " Git
  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('tpope/vim-fugitive')

  " Syntax color
  call minpac#add('aklt/plantuml-syntax')
  call minpac#add('digitaltoad/vim-jade')

  " Syntax
  call minpac#add('godlygeek/tabular')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-endwise')
  call minpac#add('tpope/vim-surround')

  " Debug
  call minpac#add('scrooloose/syntastic')

  " Bar
  call minpac#add('vim-airline/vim-airline')

  " Show marks
  call minpac#add('kshenoy/vim-signature')

  " Searching
  call minpac#add('ctrlpvim/ctrlp.vim')
  call minpac#add('majutsushi/tagbar')
  call minpac#add('scrooloose/nerdtree')

  " Colorscheme
  call minpac#add('morhetz/gruvbox')

  " Icons
  call minpac#add('tiagofumo/vim-nerdtree-syntax-highlight')
  call minpac#add('ryanoasis/vim-devicons')
endif

""""""""""""""""""""
" Plugins
""""""""""""""""""""
" Airline
let g:airline#extensions#tabline#enabled=1         " Tabline
let g:airline#extensions#tabline#show_buffers=0    " Disable buffers
let g:airline#extensions#tabline#show_splits=0     " Disable buffers
let g:airline#extensions#tabline#show_tabs=1
let g:airline#extensions#tabline#show_tab_type = 0 " Hide right tab indicator
let g:airline#extensions#tabline#show_close_button = 0

set noshowmode                               " Removes the mode duplication -- INSERT --
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=1          " Remove angle at the end
let g:airline_detect_spell=0                 " Remove SPELL
let g:airline_theme='gruvbox'
let g:airline_mode_map={
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

" CtrlP
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|bower_components)|(\.(swp|ico|git|svn))$'

" DevIcons
if has("gui_running")
  set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ \Complete:h11
endif
au! bufwritepost .vimrc call webdevicons#hardRefresh()

" GitGutter
hi clear SignColumn

" NeoComplete
let g:neocomplete#enable_at_startup=1
ino <expr> <C-j> ((pumvisible())?("\<C-n>"):("j"))
ino <expr> <C-k> ((pumvisible())?("\<C-p>"):("k"))

" NERDTree
nno <tab> :NERDTreeToggle<cr>
let NERDTreeMinimalUI=1

" Tabularize
vno <tab> :Tabularize<cr>
vno <C-tab> :Tabularize /=<cr>
vno <S-tab> :Tabularize /:<cr>

" Tagbar
nno <F2> :Tagbar<cr>
let g:tagbar_compact=1
let g:tagbar_indent=0

" Syntastic
highlight SyntasticErrorLine guibg=#4C1C14
highlight SyntasticWarningLine guibg=#4B3F15
