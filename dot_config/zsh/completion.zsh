### enable comomand completion
if [ -f "$HOME/.local/share/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh" ]; then
    source $HOME/.local/share/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

    # todo: need to add wslvar check
    if type nixos-version >/dev/null; then
        bindkey "''${key[Up]}" up-line-or-search
    fi
else
    # autoload -Uz compinit
    # compinit

    # ### load completion files with .zsh extension
    # for comp in $ZDOTDIR/comp/*.zsh; do
    #     source $comp
    # done
fi
