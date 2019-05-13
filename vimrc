set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-fugitive'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
Plugin 'klen/python-mode'
Plugin 'bps/vim-textobj-python'
Plugin 'davidhalter/jedi-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'ternjs/tern_for_vim'
Plugin 'kana/vim-textobj-user'
Plugin 'gregsexton/MatchTag'
Plugin 'Raimondi/delimitMate'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'junegunn/vim-easy-align'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'suan/vim-instant-markdown'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'ajorgensen/vim-markdown-toc'
Plugin 'elzr/vim-json'
Plugin 'sheerun/vim-polyglot'

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
set background=dark
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
" Clear highlighting on escape in normal mode
nnoremap <silent> <esc> :noh<cr><esc>
" search for visually selected text
vnoremap // y/<C-R>"<CR>

"Custom key mappings
inoremap jj <Esc>
let mapleader = "\<Space>"                      " Set leader to space
" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>
" Stop the stupid window from popping up
map q: :q
" Yank from the cursor to the end of the line
nnoremap Y y$
" Leader w to save
nnoremap <Leader>w :w<CR>

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
nnoremap <Leader>o :CtrlPMRU<CR>
let g:ctrlp_mruf_relative = 1

" NerdTree
" Open NERDTree when vim starts up but focus on main editor
autocmd vimenter * NERDTree | wincmd p
" Close vim if only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <Leader>n :NERDTreeToggle<CR>

" Vim Airline
" Fix airline not showing up until a split
set laststatus=2
" Set airline theme
let g:airline_theme = "solarized"

" Tagbar
" Opening tagbar
nmap <Leader>O :TagbarOpen fjc<CR>

" Vim Gitgutter
set updatetime=100
nmap ∆ <Plug>GitGutterNextHunk " map alt+j to go to next hunk
nmap ˚ <Plug>GitGutterPrevHunk " map alt+k to go to previous hunk
nmap j <Plug>GitGutterNextHunk " map alt+j to go to next hunk
nmap k <Plug>GitGutterPrevHunk " map alt+k to go to previous hunk
nmap <Leader>ga <Plug>GitGutterStageHunk
nmap <Leader>gz <Plug>GitGutterUndoHunk

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
" <CR> close popup and save indent or expand snippet
function! CleverCr()
    if pumvisible()
        if neosnippet#expandable()
            let exp = "\<Plug>(neosnippet_expand)"
            return exp . neocomplete#smart_close_popup()
        else
            return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
        endif
    else
        return "\<CR>"
    endif
endfunction
" <CR> close popup and save indent or expand snippet
imap <expr> <CR> CleverCr()
" Tab completion (shift Tab for going backwards) for Neocomplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
" <Down> and <Up> cycle like <Tab> and <S-Tab>
inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
" <ESC> takes you out of insert mode and also gets rid of suggestions window
inoremap <expr> <Esc>   pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
" Cap maximum suggestions
let g:neocomplete#max_list = 15

" Neosnippet
" Enable snipmate compatibility mode
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd BufNewFile,BufRead *.md set spell filetype=markdown
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" Youcompleteme
" Close omni-completion once a selection is made
"let g:ycm_autoclose_preview_window_after_insertion = 1

" Python Mode
" Solve conflict with youcompleteme
let g:pymode_rope_complete_on_dot = 0
" Disable pymode rope autocompletion to avoid conflict with jedi
let g:pymode_rope_completion=0
" Disable code folding
let g:pymode_folding = 0
" Keybinding to fix python lint errors
autocmd filetype python nnoremap <Leader>pl :PymodeLintAuto<CR>
" Replace Python Mode's Run keybinding
autocmd filetype python nnoremap <buffer> <Leader>r :!clear;python %<CR>

" Jedi Vim
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0

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

" DelimitMate
let delimitMate_expand_cr = 1

" Vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 0

" Vim Fugitive
nnoremap <leader>gs :Gstatus<CR>7j
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gp :Git push<CR>

" Vim Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Vim Better Whitespace
nnoremap <leader>ws :StripWhitespace<CR>

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
