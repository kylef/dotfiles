set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

set inccommand=nosplit

lua <<EOF
  require 'kyle'
EOF
