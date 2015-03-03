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
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = 'L'
let g:airline_symbols.paste = 'Þ'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_mode_map = {
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
let g:airline_symbols#whitespace = 'Ξ'

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
    if isdirectory($HOME . '/.cache/vim/undo') == 0
        :silent !mkdir -p ~/.cache/vim/undo > /dev/null 2>&1
    endif
    set undodir=./.vim-undo//
    set undodir+=~/.cache/vim/undo//
    set undofile
    set noswapfile
else
    set number
    " Save your swp files to a less annoying place than the current directory.
    " If you have .vim-swap in the current directory, it'll use that.
    " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
    if isdirectory($HOME . '/.cache/vim/swap') == 0
        :silent !mkdir -p ~/.cache/vim/swap >/dev/null 2>&1
    endif
    set directory=./.vim-swap//
    set directory+=~/.cache/vim/swap//
    set directory+=~/tmp//
    set directory+=.
endif
if has('mouse')
    set mouse=a
endif
let mapleader=","
let maplocalleader=","

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

nnoremap Q gq

inoremap jk <Esc>

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
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Columns
set colorcolumn=80
set tw=80

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

set pastetoggle=<F2>

nnoremap <F5> :GundoToggle<CR>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" -----------------------
" Syntastic configuration
" -----------------------
let g:syntastic_check_on_open=1
let g:syntastic_stl_format = '[%E{E:%e}%B{/}%W{W:%w}]'
let syntastic_error_symbol = 'E'
let syntastic_style_error_symbol = 'S'
let syntastic_warning_symbol = 'w'
let syntastic_style_warning_symbol ='s'

let g:syntastic_tex_chktex_quiet_messages = { "type":  "style",
                                             \ "regex": 'Command terminated with space.' }



" -----------------------
" Pantondoc configuration
" -----------------------
let g:pantondoc_enabled_modules = ["formatting", "folding",
    \ "command", "bibliographies", "completion", "toc", "metadata"]
let g:pantondoc_command_latex_engine="pdflatex"
let g:pantondoc_biblio_sources="bctg"
let g:pantondoc_use_pandoc_markdown = 1
let g:pandoc_use_embeds_in_codeblocks_for_langs = ["haskell", "c"]
let g:pantondoc_folding_fold_yaml = 1
let path = $PATH
" au BufNewFile,BufRead *.md   set filetype=pandoc

" --------------------------
" Custom lhaskell.vim syntax
" --------------------------
let b:lhs_markup="pandoc"


let g:tex_conceal= 'abdmgsS'

" -----------------
" Calendar settings
" -----------------
let g:calendar_monday=1
let g:calendar_mark = 'right'
let g:calendar_weeknm = 5
let g:calendar_filetype = 'pandoc'


au BufNewFile,BufRead *.tex   set filetype=tex


let g:voom_ft_modes = {'pandoc': 'pandoc', 'tex': 'latex'}
" ------------------
" Fugitive shortcuts
" ------------------
nnoremap <leader>gs :Gstatus<cr>

" -------------------
" CtrlP configuration
" -------------------
function! CtrlPMatch(items, str, limit, mmode, ispath, crfile, regex) abort
  let items = copy(a:items)
  if a:ispath
    call filter(items, 'v:val !=# a:crfile')
  endif
  return haystack#filter(items, a:str)
endfunction
let g:ctrlp_match_func = {'match': function('CtrlPMatch')}
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" ----------------------
" Projectionist defaults
" ----------------------
let g:projectionist_heuristics = {
      \ "*.cabal": {
      \     "test/*/Tests.hs": { "alternate": "src/{}.hs",
      \                          "type":"test",
      \                          "template": ["module {capitalize|dot}.Tests where"] },
      \     "src/*.hs": { "alternate": "test/{}/Tests.hs",
      \                   "type": "src",
      \                   "template": [ "{-|",
      \                                 "Module      : {capitalize|dot}",
      \                                 "Copyright   : (c) 2014 Julien Tanguy",
      \                                 "License     : BSD3",
      \                                 "",
      \                                 "Maintainer  : julien.tanguy@jhome.fr",
      \                                 "Stability   : experimental",
      \                                 "Portability : portable",
      \                                 "",
      \                                 "",
      \                                 "",
      \                                 "-}",
      \                                 "module {capitalize|dot} where"] },
      \     "*": {"make": "cabal build",
      \           "start": "cabal run"
      \          }
      \ }}

" augroup haskell
"     au FileType haskell nnoremap <buffer> <F6> :HdevtoolsType<CR>
"     au FileType haskell nnoremap <buffer> <F7> :HdevtoolsInfo<CR>
"     au FileType haskell nnoremap <buffer> <silent> <F8> :HdevtoolsClear<CR>
" augroup END

if filereadable(".vim.custom")
    so .vim.custom
endif
