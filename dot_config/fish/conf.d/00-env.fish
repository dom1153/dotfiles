set -gx SHELL $(which fish)
set -gx COLORTERM truecolor
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx XDG_CONFIG_HOME "$HOME/.config" # fix lazygit config directory for MacOS
set -gx STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"
set -gx HOMEBREW_NO_ENV_HINTS 1
set -gx EDITOR vi # Can get overriden with helix integration
