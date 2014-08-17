set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'Keithbsmiley/swift.vim'
Plug 'airblade/vim-gitgutter'
Plug 'dag/vim-fish'
Plug 'kien/ctrlp.vim'
Plug 'kylef/apiblueprint.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/syntastic'

call plug#end()

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

set hlsearch " Highlight all search matches
set cursorline " Highlight current line

set wrap " Turn on line wrapping
set textwidth=79
set colorcolumn=80
set scrolloff=2 " Show 2 lines around the cursor (when scrolling off the page)

set title " Set the terminal title

set visualbell " Disable beeping

set incsearch " Highlight matches as you type
set hlsearch " Highlight matches

set laststatus=2 " Always show status bar

" Highlight the status bar when in insert mode
au InsertEnter * hi StatusLine ctermfg=235 ctermbg=10
au InsertLeave * hi StatusLine ctermfg=15 ctermbg=240

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
autocmd FileType gitcommit setlocal spell textwidth=72
set showbreak=↪

" Podspecs ------ {{{
augroup ft_podspec
  autocmd!
  autocmd BufNewFile,BufRead,BufWrite *.podspec setlocal filetype=podspec
  autocmd BufNewFile,BufRead Podfile setlocal filetype=podfile
  autocmd FileType podspec,podfile set syntax=ruby
  autocmd FileType podspec set makeprg=pod\ spec\ lint\ %
  autocmd FileType podfile set makeprg=pod\ install
augroup END
" }}}

nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,trail:▝,eol:¬
set list

set mouse=a

" Paste
command! Pa :w !curl -F 'paste=<-' http://s.drk.sc

" Wordcount
command! Wc :w !wc

autocmd FileType rst set makeprg=rst2pdf\ %

color jellybeans

" autocmd BufWritePre * :%s/\s\+$//e

set wildignore+=*/venv/*

" Yeah... these get typoed
command W w
command Q q
command Wq wq
command WQ wq 

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_post_private = 1

" Syntastic
let g:syntastic_python_flake8_args="--max-complexity 10"

if &shell =~# 'fish$'
  set shell=bash
endif

