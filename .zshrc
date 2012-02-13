. ~/.rc

if [ -s ~/.oh-my-zsh/oh-my-zsh.sh ] ; then
  # Path to your oh-my-zsh configuration.
  export ZSH=$HOME/.oh-my-zsh
  export ZSH_THEME="jreese"
  export DISABLE_AUTO_UPDATE="true"

  plugins=()
  command_exists git && plugins+=git
  command_exists brew && plugins+=brew
  command_exists pacman && plugins+=archlinux

  source $ZSH/oh-my-zsh.sh
fi

[[ -s "$HOME/.autoenv/activate.sh" ]] && source "$HOME/.autoenv/activate.sh"
