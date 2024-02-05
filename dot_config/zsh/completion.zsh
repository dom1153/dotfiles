### enable command completion
autoload -Uz compinit
compinit

### load completion files with .zsh extension
for comp in $ZDOTDIR/comp/*.zsh; do
    source $comp
done