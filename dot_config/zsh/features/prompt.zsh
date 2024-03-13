export PS1="╭─ %F{green}%n@%m%f | %F{blue}%W%f | %F{blue}%t %f
│ %1~
╰─%# "

if type "starship" >/dev/null; then
  eval "$(starship init zsh)"
fi
