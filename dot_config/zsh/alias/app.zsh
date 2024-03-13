### === app specific aliases
if ! type "trash" >/dev/null; then
  alias rm='rm -i'
else
  # alias rm='echo "Trashing..." && trash'
  alias rm=trash
fi

if type "pnpm" >/dev/null; then
  alias pn=pnpm
else
  alias pn="missingapp pnpm"
fi

if type "tmuxinator" >/dev/null; then
  alias mux=tmuxinator
else
  alias pn="missingapp tmux"
fi

# if type "nvim" >/dev/null; then
# alias vim="nvim"
# fi

if type "eza" >/dev/null; then
  alias ls="eza"
fi

if type "bat" >/dev/null; then
  alias cat="bat"
fi

### copying terminfo per remote is awful, so just alias
if [[ $TERM == "foot" ]]; then
  ### keep the alias simple to allow shell completion / suggestions
  ### which means no & sadly. zsh does not have alias parameters, only functions
  alias ssh='kitty kitten ssh'
fi

if type "zellij" >/dev/null; then
  alias zl="zellij --layout"
fi

if type "chezmoi" >/dev/null; then
  alias ce="chezmoi edit"
  alias ca="chezmoi apply"
  alias cdiff="chezmoi diff"
  alias cu="chezmoi unmanaged ."
  alias cup="chezmoi update"
  alias ccd="chezmoi update"
  alias cr="chezmoi remove"
fi

if type "chezmoi" >/dev/null; then
  alias ce="chezmoi edit"
  alias ca="chezmoi apply"
  alias cadd="chezmoi add"
  alias cdiff="chezmoi diff"
  alias cunm="chezmoi unmanaged ."
  alias cu="chezmoi update"
  alias cdd="chezmoi cd"
  alias cr="chezmoi remove"
fi
