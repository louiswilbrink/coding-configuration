" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" *** VUNDLE ***
Plugin 'gmarik/Vundle.vim'

" Search
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'

" Syntax highlighting.
Bundle 'digitaltoad/vim-pug'
Bundle 'groenewege/vim-less'
Bundle 'altercation/vim-colors-solarized'
Plugin 'derekwyatt/vim-scala'
Plugin 'leafgarland/typescript-vim'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'

" Functionality
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'

" File Exploration
Bundle 'scrooloose/nerdtree'

" Miscellaneous
Bundle 'scrooloose/nerdcommenter'

" .NET development
Bundle 'omnisharp/omnisharp-vim'
Bundle 'vim-syntastic/syntastic'
Bundle 'tpope/vim-dispatch'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
filetype plugin on
filetype off

" SETTINGS
set nocompatible
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set hlsearch
" Keep three lines between the cursor and the top/bottom of the window.
set scrolloff=3
" Display current cursor position in bottom right corner.
set ruler
" Mark the 80th character to follow width limits.
set colorcolumn=80
" See relative line numbers.
set relativenumber
" Show current line number on cursor line.
set number
" Toggle -- INSERT (Paste) --
set pastetoggle=<F2>
" When searching for a string, ignore case.
set ignorecase
set clipboard=unnamed

" Keep swap files in .vim -- avoid cluttering codebase.
set dir=~/.vim

" Enter normal mode using jk
imap jk <ESC>
imap fd <ESC>

" Easier moving in tabs and windows
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" CtrlP: Don't search these folders.
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules\|DS_Store\|git\|target\|platform\|plugins' }

" THEME
set t_Co=256
let g:solarized_termcolors=256
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
syntax enable     " Use syntax highlighting
set background=dark
colorscheme solarized

au BufNewFile,BufRead *.ejs set filetype=html

" Easier moving in tabs and windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" Full screen the current pane.
map <F11> <C-W>_<C-W><Bar>
" Make all panes the same size.
map <F12> <C-W>=

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction

com! DiffSaved call s:DiffWithSaved()

set clipboard=unnamed
