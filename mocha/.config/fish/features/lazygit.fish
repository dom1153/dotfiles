# Lazygit has no includes: merge this package's theme.yml (Catppuccin Mocha, delta theme) over core's config.yml
if exists lazygit
    set -gx LG_CONFIG_FILE "$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/theme.yml"
end
