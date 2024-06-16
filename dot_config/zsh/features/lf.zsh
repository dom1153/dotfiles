lfcd () {
    # `command` is needed in case `lfcd` is aliased to `lf`
    cd "$(command lf -print-last-dir "$@")"
}

bindkey -s '^f' 'lfcd\n'  # zsh
