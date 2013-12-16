" My vim configuration file
" Largely inspired by the great article from Steve Losh
" Great thanks for Tim Pope and Ethan Schoonover for their great plugins

" Disable vi compatibility
set nocompatible

" Load plugins managed by pathogen
filetype off " Fixes issues with ftdetect files. See pathogen docs.

let g:pathogen_disabled = ['pathogen'] " Prevent pathogen from self-sourcing
call pathogen#infect()
call pathogen#helptags()

" Enable filetype plugins
filetype plugin indent on

" -----------------------
" Solarized configuration
" -----------------------
syntax on
set background=dark
colorscheme solarized

" ---------------------
" Airline configuration
" ---------------------
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_linecolumn_prefix = '␊ '
let g:airline_fugitive_prefix = 'BR '
let g:airline_paste_symbol = 'Þ'

" ---------------------
" General configuration
" ---------------------
" Tabulations
set tabstop=4 "A tab character is 4 spaces wide
set shiftwidth=4 "Shifts use 4 spaces
set expandtab "Use spaces instead of tabs

" Other interesting options (see Steve Losh's blog post)
set encoding=utf-8
set scrolloff=5 "At least keep 5 lines visible over or below current line
set autoindent
set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
if version >= 703
    " Set both number and relativenumber for numbers plugin
    set relativenumber
    set number
    " undofile - This allows you to use undos after exiting and restarting
    " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
    " :help undo-persistence
    " This is only present in 7.3+
    if isdirectory($HOME . '/.vim/undo') == 0
        :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
    endif
    set undodir=./.vim-undo//
    set undodir+=~/.vim/undo//
    set undofile
    set noswapfile
else
    set number
    " Save your swp files to a less annoying place than the current directory.
    " If you have .vim-swap in the current directory, it'll use that.
    " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
    if isdirectory($HOME . '/.vim/swap') == 0
        :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
    endif
    set directory=./.vim-swap//
    set directory+=~/.vim/swap//
    set directory+=~/tmp//
    set directory+=.
endif
if has('mouse')
    set mouse=a
endif
let mapleader=","

" Search options
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

nnoremap j gj
nnoremap k gk

inoremap jj <Esc>

" Learn vim hjkl the hard way
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>


" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Columns
set colorcolumn=80
set tw=80

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

set pastetoggle=<F2>

" -----------------------
" Syntastic configuration
" -----------------------
let g:syntastic_check_on_open=1
let g:syntastic_stl_format = '[%E{E:%e}%B{/}%W{W:%w}]'
let syntastic_error_symbol = 'E'
let syntastic_style_error_symbol = 'S'
let syntastic_warning_symbol = 'w'
let syntastic_style_warning_symbol ='s'

" -----------------------
" Pantondoc configuration
" -----------------------
let g:pantondoc_command_latex_engine="pdflatex"
let g:pantondoc_biblio_sources="bctg"
let g:pandoc_use_embeds_in_codeblocks_for_langs = ["haskell"]
au BufNewFile,BufRead *.md   set filetype=pandoc

" --------------------------
" Custom lhaskell.vim syntax
" --------------------------
let b:lhs_markup="pandoc"

