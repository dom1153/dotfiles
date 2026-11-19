if test -d $HOME/.local/share/pnpm
    set -gx PNPM_HOME $HOME/.local/share/pnpm
    fish_add_path -g -p $PNPM_HOME
end
