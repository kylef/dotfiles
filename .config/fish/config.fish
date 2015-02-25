set fish_greeting

set -x GEM_HOME $HOME/gems
set PATH $GEM_HOME/bin $PATH

set -x LSCOLORS Gxfxcxdxbxegedabagacad
set -x EDITOR vim

set -x PIP_REQUIRE_VIRTUALENV "true"

alias home="git --work-tree=$HOME --git-dir=$HOME/.files.git"
