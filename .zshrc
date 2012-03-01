. ~/.rc

if [ -s ~/.oh-my-zsh/oh-my-zsh.sh ] ; then
  # Path to your oh-my-zsh configuration.
  export ZSH=$HOME/.oh-my-zsh
  export ZSH_THEME="terminalparty"
  export DISABLE_AUTO_UPDATE="true"

  plugins=(git brew archlinux fabric)

  source $ZSH/oh-my-zsh.sh
fi

[[ -s "$HOME/.autoenv/activate.sh" ]] && source "$HOME/.autoenv/activate.sh"
