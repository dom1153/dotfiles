### enable command completion
### either $SSH_CONNECTION or $SSH_TTY work
### https://github.com/marlonrichert/zsh-autocomplete/issues/691
if [ -f "$HOME/.local/share/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh" ] && [ -z $SSH_CONNECTION ] && ! type "wslvar" >/dev/null ; then
    source $HOME/.local/share/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

    # todo: need to add wslvar check
    if type nixos-version >/dev/null; then
        bindkey "''${key[Up]}" up-line-or-search
    fi

    ### pass arguments to compinit
    zstyle '*:compinit' arguments -D -i -u -C -w

    ### Make Tab go straight to the menu and cycle there
    bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
    bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
else
    autoload -Uz compinit
    compinit

    ### load completion files with .zsh extension
    for comp in $ZDOTDIR/comp/*.zsh; do
        source $comp
    done
fi
