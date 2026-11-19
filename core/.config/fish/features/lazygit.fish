if exists lazygit
    set -gx LG_CONFIG_FILE "$HOME/.config/lazygit/config.yml"

    if test -f "$HOME/.config/lazygit/theme.yml"
        set LG_CONFIG_FILE "$LG_CONFIG_FILE,$HOME/.config/lazygit/theme.yml"
    end
end
