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
  alias cadd="chezmoi add"
  alias cdiff="chezmoi diff"
  alias cu="chezmoi unmanaged ."
  alias cup="chezmoi update"
  alias cdd="chezmoi cd"
  alias cr="chezmoi remove"
fi

if type "git" >/dev/null; then
  alias ga="git add"
  alias gaa="git add *"
  alias gd="git diff"
  alias gdd="git diff --cached"
  alias gcm="git commit -m"
  alias gpush="git push"
  alias gpull="git pull"
  alias gs="git status"
fi

if type "btop" >/dev/null; then
  alias top="btop"
fi

if ! type "rg" >/dev/null; then
    source ../functions/si.zsh
else
    alias si="rg"
fi

if ! type "fd" >/dev/null; then
    alias ff="find . -name "
else
    alias ff="fd --type f --hidden --exclude .git | fzf --reverse"
    alias ffe="fd --type f --hidden --exclude .git | fzf --reverse | xargs $EDITOR -"
fi

if type "tldr" >/dev/null; then
  if type "fzf" >/dev/null; then
    alias tldrf='tldr --list | fzf --preview "tldr {1} --color" --preview-window=right,70% | xargs tldr'
  fi
fi

if type "doas" >/dev/null; then
  alias sudo="doas"
fi