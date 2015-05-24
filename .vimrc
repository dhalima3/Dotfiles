set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'

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

"Colors and appearance
set t_Co=256
set background=dark
colorscheme molokai
set nu                        " number lines
set ruler                     " show ruler, current position in file

"Searching
set hlsearch		             " highlight matches
set ignorecase		             " searches are case insensitive...
set smartcase		             " ...unless they contain at least one cap
set incsearch                    " incremental search (as string is being typed in)
nnoremap <CR> :noh<CR><CR>       

"Custom key mappings
imap jj <Esc>
let mapleader = ","

hi Normal ctermbg=none

" disable arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Plugin configuration

" ctrlp
nnoremap ; :CtrlPBuffer<CR>

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
