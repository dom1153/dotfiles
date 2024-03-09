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

if type "zoxide" >/dev/null; then
  eval "$(zoxide init --cmd cd zsh)"
fi
