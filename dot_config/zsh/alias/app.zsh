### === app specific aliases
if ! type "trash" > /dev/null; then
  alias rm='rm -i'
else
  # alias rm='echo "Trashing..." && trash'
  alias rm=trash
fi

if type "pnpm" > /dev/null; then
  alias pn=pnpm
else
  alias pn="missingapp pnpm"
fi

if type "tmuxinator" > /dev/null; then
  alias mux=tmuxinator
else 
  alias pn="missingapp tmux"
fi

if type "nvim" > /dev/null; then
  alias vim="nvim"
fi
