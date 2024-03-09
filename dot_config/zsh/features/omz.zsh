if [[ -d "$HOME/.oh-my-zsh" ]]; then
  ### disable auto-update check
  DISABLE_UPDATE_PROMPT=true

  # === THEME
  # bira
  # robbyrussell  # A very fast, minimal theme
  # agnoster      # is fun but a slow theme
  # candy         # like bira, has time, but less interesting
  # bira          # two line prompt piped together
  # spaceship     # plugin/addon prompt with easy customization

  # === load oh-my-zsh
  export ZSH=$HOME/.oh-my-zsh
  source $ZSH/oh-my-zsh.sh
fi
