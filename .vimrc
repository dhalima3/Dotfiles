set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-fugitive'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
"Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
Plugin 'klen/python-mode'
Plugin 'pangloss/vim-javascript'
Plugin 'kana/vim-textobj-user'
Plugin 'bps/vim-textobj-python'
Plugin 'gregsexton/MatchTag'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Syntax and indentation
syntax on                     " turn on syntax highlighting
set showmatch                 " show matching braces when text indicator is over them
"filetype plugin indent on     " enable file type detection 
set autoindent                " align the new line indent with the previous line
set nowrap 		              " don't wrap lines
set expandtab		          " insert spaces, not tabs
set tabstop=4                 " a hard TAB displays as 4 columns
set shiftwidth=4              " indent/unident 4 columns 
set softtabstop=4             " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set backspace=2               " Backspace deletes like most programs in insert mode

"Colors and appearance
set t_Co=256
set background=light
colorscheme solarized
set nu                        " number lines
set ruler                     " show ruler, current position in file

"Searching
" highlight matches
set hlsearch
" searches are case insensitive...
set ignorecase
" ...unless they contain at least one cap
set smartcase
" incremental search (as string is being typed in)
set incsearch
" pressing enter key will clear highlighted search results
nnoremap <CR> :noh<CR><CR>
" search for visually selected text
vnoremap // y/<C-R>"<CR>

"Custom key mappings
inoremap jj <Esc>
let mapleader = "\<Space>"                      " Set leader to space
" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

hi Normal ctermbg=none

" copy and paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" disable arrow keys
"nnoremap <Left> :echoe "Use h"<CR>
"nnoremap <Right> :echoe "Use l"<CR>
"nnoremap <Up> :echoe "Use k"<CR>
"nnoremap <Down> :echoe "Use j"<CR>

" Plugin configuration

" Ctrlp
" Opening a file
nnoremap <Leader>O :CtrlP<CR>

" Vim Airline
" Fix airline not showing up until a split
set laststatus=2
" Set airline theme
let g:airline_theme = "solarized"

" Tagbar
" Opening tagbar
nmap <Leader>o :TagbarOpen fjc<CR>

" Youcompleteme
" Close omni-completion once a selection is made
let g:ycm_autoclose_preview_window_after_insertion = 1

" Python Mode
" Solve conflict with youcompleteme
let g:pymode_rope_complete_on_dot = 0

" Vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" Extend the global default (NOTE: Remove comments in dictionary before sourcing)
call expand_region#custom_text_objects({
      \ "\/\\n\\n\<CR>": 1, 
      \ 'a]' :1, 
      \ 'ab' :1,
      \ 'aB' :1,
      \ 'ii' :0, 
      \ 'ai' :0, 
      \ })

" Customize text objects for python
call expand_region#custom_text_objects('python', {
      \ 'af' :0, 
      \ 'if' :0,
      \ 'ac' :0,
      \ 'ic' :0,
      \ })

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
