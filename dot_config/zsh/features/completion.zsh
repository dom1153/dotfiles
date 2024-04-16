### enable command completion
### either $SSH_CONNECTION or $SSH_TTY work
### https://github.com/marlonrichert/zsh-autocomplete/issues/691
### using fish; so I don't want to deal with troubleshooting this anymore
if false && [ -f "$HOME/.local/share/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh" ] && [ -z $SSH_CONNECTION ] && [ -z $VSCODE_SHELL_INTEGRATION ] && ! type "wslvar" >/dev/null ; then
    source $HOME/.local/share/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

    if type nixos-version >/dev/null; then
        # bindkey "''${key[Up]}" up-line-or-search
        # bindkey "''${key[Up]}" up-line-or-history
    fi

    #### https://github.com/marlonrichert/zsh-autocomplete/tree/620ffcaaadf65eb2203d754905cf7882738e774c
    () {
        local -a prefix=( '\e'{\[,O} )
        local -a up=( ${^prefix}A ) down=( ${^prefix}B )
        local key=
        for key in $up[@]; do
            bindkey "$key" up-line-or-history
        done
        for key in $down[@]; do
            bindkey "$key" down-line-or-history
        done
    }

    ### pass arguments to compinit
    ### keep this here. seems to be useful to when switching between versions
    zstyle '*:compinit' arguments -D -i -u -C -w >/dev/null

    # ### Make Tab go straight to the menu and cycle there
    bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
    bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

    ### perhaps how to let history show older entries intstead of wrapping
    ### Autocompletion
    # zstyle -e ':autocomplete:list-choices:*' list-lines 'reply=( $(( LINES / 3 )) )'

    ### Override history search.
    # zstyle ':autocomplete:history-incremental-search-backward:*' list-lines 8

    ### History menu.
    # zstyle ':autocomplete:history-search-backward:*' list-lines 128
else
    autoload -Uz compinit
    compinit

    ### load completion files with .zsh extension
    for comp in $ZDOTDIR/comp/*.zsh; do
        source $comp
    done
fi
