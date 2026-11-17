### env and PATH config (interactive and scripts)

set -gx COLORTERM truecolor
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx XDG_CONFIG_HOME "$HOME/.config" # MacOS: avoid configs in ~/Library/Application Support (e.g. lazygit)
set -gx HOMEBREW_NO_ENV_HINTS 1
set -gx EDITOR vi # Can get overriden with helix integration

### source homebrew (Apple Silicon, Intel macOS, Linux system, Linux user)
for brew in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew ~/.linuxbrew/bin/brew
    if test -x $brew
        $brew shellenv fish | source
        break
    end
end

### source fish after brew (e.g. fish is installed via brew)
set -gx SHELL (command -s fish; or status fish-path)

fish_add_path -g -p $HOME/go/bin
fish_add_path -g -p $PNPM_HOME
