set fish_greeting

set -x LANG en_GB.UTF-8

set -x LSCOLORS Gxfxcxdxbxegedabagacad
set -x EDITOR vim
set -x MANPAGER vimpager

set -x PIP_REQUIRE_VIRTUALENV "true"
set -x PYTHONSTARTUP $HOME/.pystartup

alias h="env GIT_WORK_TREE=$HOME GIT_DIR=$HOME/.files.git"

# swiftenv
if test -d "$HOME/.swiftenv"
  status --is-interactive; and . (swiftenv init -|psub)
end

set -x FZF_DEFAULT_COMMAND 'ag -g ""'

eval (direnv hook fish)
