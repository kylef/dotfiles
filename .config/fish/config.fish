set fish_greeting

set -x GEM_HOME $HOME/gems
set PATH $GEM_HOME/bin $PATH

set -x LSCOLORS Gxfxcxdxbxegedabagacad
set -x EDITOR vim
set -x PAGER vimpager

set -x PIP_REQUIRE_VIRTUALENV "true"
set -x PYTHONSTARTUP $HOME/.pystartup

alias home="git --work-tree=$HOME --git-dir=$HOME/.files.git"

# swiftenv
if test -d "$HOME/.swiftenv"
  setenv SWIFTENV_ROOT "$HOME/.swiftenv"
  setenv PATH "$SWIFTENV_ROOT/bin" $PATH
  status --is-interactive; and . (swiftenv init -|psub)
end
