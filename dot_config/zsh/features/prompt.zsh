if type "starship" >/dev/null; then
  ### should remove warning for git branch taking too long to load
  export STARSHIP_LOG="error"
  eval "$(starship init zsh)"
else
  ### don't export by default ; keeps PS1 clean for zsh -> other shell flow
  export PS1="╭─ %F{green}%n@%m%f | %F{blue}%W%f | %F{blue}%t %f
  │ %1~
  ╰─%# "
fi