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
	set guifont=Inconsolata:h14 "Set default font: Incosolata
  set guioptions=egmrt "Remove gui icons
  set background=dark
  colorscheme solarized
endif
