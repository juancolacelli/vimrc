" Pathogen
execute pathogen#infect()

""""""""""""""""""""
" Configurations
""""""""""""""""""""
set spell                 " Spelling
set spelllang=en          " Spelling languages
set wildmenu              " Terminal autocomplete
set wildmode=list:longest " Long terminal autocomplete

" Indentation
filetype plugin indent on " File type indentation
set autoindent            " Automatic indentation
set copyindent            " Copy last indentation
set expandtab             " Spaces instead of tabs
set preserveindent        " Preserve indentation
set shiftwidth=2          " 2 spaces by indent
set smartindent           " Tabs and spaces are the same
set smarttab              " Start indentation based on the start of the line
set tabstop=2             " 2 spaces by tab

" Search
set hlsearch   " Highlight current search
set ignorecase " Ignore case sensitive
set incsearch  " Incremental search
set smartcase  " Ignore case if search is lowercase

" Backups
set nobackup      " Disable backup
set nowritebackup " Disable backups
set noswapfile    " Disable swap

" Edition
set autoread                                  " Auto-reload on change
set confirm                                   " Confirm changes on exit
set colorcolumn=80                            " Right margin
set hidden                                    " Save undo on exit
set history=1000                              " Command history
set joinspaces                                " Join spaces
set linespace=0                               " Remove spaces between lines
set list                                      " Muestra tabs y espacios
set listchars=tab:->,trail:-,extends:#,nbsp:. " Show tabs and spaces
set matchpairs=(:),{:},[:],<:>                " Highlight by pairs
set matchtime=10                              " Highlight timer
set number                                    " Show line number
set numberwidth=4                             " Line number max 9999
set ruler                                     " Show cursor position
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
autocmd BufWritePre * :%s/\s\+$//e


""""""""""""""""""""
" Funciones
""""""""""""""""""""
" Middle button pastes
imap <MouseMiddle> <esc>"*p"
nmap <MouseMiddle> <esc>"*p"


""""""""""""""""""""
" Tags
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
nore , :
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
" under_score / CamelCase
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
set nofoldenable        " Dont fold by default
set foldlevel=1         " This is just what i use


""""""""""""""""""""
" Colors
""""""""""""""""""""
set background=dark    " Dark background
colorscheme gruvbox    " Color scheme
set cursorline         " Highlight current line
set cursorcolumn       " Highlight current column
set laststatus=2       " Show statusbar
syn on                 " Highlight syntax

" GUI?
if has("gui_running")
  set guioptions-=T  " Disable toolbar
  set transparency=5 " Transparency 5%
endif


""""""""""""""""""""
" .vimrc
""""""""""""""""""""
" Open .vimrc
map <leader>v :e! ~/.vimrc<cr>"

" Reopen .vimrc when saved
autocmd! bufwritepost .vimrc source ~/.vimrc"


""""""""""""""""""""
" Plugins
""""""""""""""""""""
" Coffeescript colors
au BufNewFile,BufRead *.coffee set filetype=coffee

" GitGutter
hi clear SignColumn

" NeoComplete
let g:neocomplete#enable_at_startup = 1
ino <expr> <C-j> ((pumvisible())?("\<C-n>"):("j"))
ino <expr> <C-k> ((pumvisible())?("\<C-p>"):("k"))

" NERDTree
nno <tab> :NERDTreeToggle<cr>

" Tabularize
vno <tab> :Tabularize<cr>
vno <C-tab> :Tabularize /=<cr>
vno <S-tab> :Tabularize /:<cr>

" Tagbar
nno <F2> :Tagbar<cr>

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""
" Vundle
""""""""""""""""""""

" Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-pathogen'

" Autocomplete
Plugin 'Shougo/neocomplete.vim'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Git
Plugin 'airblade/vim-gitgutter'

" Syntax color
Plugin 'aklt/plantuml-syntax'
Plugin 'digitaltoad/vim-jade'

" Syntax
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'

" Debug
Plugin 'scrooloose/syntastic'

" Bar
Plugin 'bling/vim-airline'

" Show marks
Plugin 'kshenoy/vim-signature'

" Searching
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'

" Colorscheme
Plugin 'morhetz/gruvbox'
