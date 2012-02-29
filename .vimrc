set nocompatible

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax enable " Syntax highlighting
filetype plugin indent on " File type detection

set backspace=indent,eol,start

set hidden " Handle multiple buffers better

" Tab completion
set wildmenu
set wildmode=list:longest

" Interface

set number " Show line numbers
set ruler " Show cursor position

set showcmd
set showmode " Show the mode in use

set wrap " Turn on line wrapping
set scrolloff=2 " Show 2 lines around the cursor (when scrolling off the page)

set title " Set the terminal title

set visualbell " Disable beeping

set incsearch " Highlight matches as you type
set hlsearch " Highlight matches

" Searching
set ignorecase
set smartcase " Be case-sensitive if expression contains a capital letter

" Backup
set nobackup
set nowritebackup
set directory=$HOME/.vim/tmp//,. " Keep swap files in one place

" Formatting
set tabstop=4 " Use 4 spaces to a tab
set shiftwidth=4 " As above
set expandtab " Expand tabs into spaces
autocmd FileType cpp set noexpandtab

set mouse=a

" Paste
command! Pa :w !curl -F 'paste=<-' http://stormy-warrior-8889.herokuapp.com

" Wordcount
command! Wc :w !wc

" Restructured text to pdf then open the pdf
command! Rp :!rst2pdf % && open %:r.pdf

color jellybeans
