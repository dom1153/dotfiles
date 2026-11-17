### env config
set -gx COLORTERM truecolor
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx XDG_CONFIG_HOME "$HOME/.config" # MacOS: avoids configs in ~/Library/Application Support (e.g. lazygit)
set -gx HOMEBREW_NO_ENV_HINTS 1

### source homebrew (Apple Silicon, Intel macOS, Linux system, Linux user)
for brew in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew ~/.linuxbrew/bin/brew
    if test -x $brew
        $brew shellenv fish | source
        break
    end
end

### set shell
if command -q fish
    set -gx SHELL (command -s fish)
end

### set EDITOR
if command -q hx
    set -gx EDITOR hx
else
    set -gx EDITOR vi
end

# PATH config
fish_add_path -g -p $HOME/go/bin
fish_add_path -g -p $PNPM_HOME
