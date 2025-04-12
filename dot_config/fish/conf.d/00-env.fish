set -gx SHELL $(which fish)
set -gx COLORTERM truecolor
set -gx MISE_COLOR false # disable mise-en-place colors due to my terminal light theme
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx XDG_CONFIG_HOME "$HOME/.config" # fix lazygit config directory for MacOS
