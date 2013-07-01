" My vim configuration file
" Largely inspired by the great article from Steve Losh
" Great thanks for Tim Pope and Ethan Schoonover for their great plugins

" ----------------------
" Pathogen configuration
" ----------------------

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
if has('gui_running')
    set guifont=Inconsolata-dz\ for\ Powerline:h12 "Set default font: Incosolata
    let g:Powerline_symbols="fancy"
    set guioptions=egmrt "Remove gui icons
else
   let g:Powerline_symbols="compatible"
endif
set background=dark
colorscheme solarized

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
"set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
if version >= 703
    set relativenumber
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

" Columns
set colorcolumn=80
set tw=80

" Unite bindings
nnoremap <C-p> :UniteWithCurrentDir file_rec/async<cr>
nnoremap <C-P> :Unite file_rec/async<cr>
nnoremap <leader>s :Unite -quick-match buffer<cr>

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

