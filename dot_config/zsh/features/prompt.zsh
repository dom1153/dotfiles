export PS1="╭─ %F{green}%n@%m%f | %F{blue}%W%f | %F{blue}%t %f
│ %1~
╰─%# "


if type "starship" >/dev/null; then
  ### should remove warning for git branch taking too long to load
  export STARSHIP_LOG="error"
  eval "$(starship init zsh)"
fi
