set nocompatible              " be iMproved, required
filetype off                  " required

"Syntax and indentation
syntax on                     " turn on syntax highlighting
set showmatch                 " show matching braces when text indicator is over them

set t_Co=256
set background=dark
colorscheme molokai

" Whitespace
set nowrap 		      " don't wrap lines
set expandtab		      " insert spaces, not tabs

"Searching
set hlsearch		      " highlight matches
set ignorecase		      " searches are case insensitive...
set smartcase		      " ...unless they contain at least one cap

"Custom key mappings
imap jj <Esc>

hi Normal ctermbg=none

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
