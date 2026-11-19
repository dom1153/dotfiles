### env config
set -gx COLORTERM truecolor
set -gx XDG_CONFIG_HOME $HOME/.config # MacOS: avoids configs in ~/Library/Application Support (e.g. lazygit)
set -gx HOMEBREW_NO_ENV_HINTS 1

### source homebrew (Apple Silicon, Intel macOS, Linux system, Linux user)
for brew in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew ~/.linuxbrew/bin/brew
    if test -x $brew
        $brew shellenv fish | source
        break
    end
end

### set SHELL
if command -q fish
    set -gx SHELL (command -s fish)
end

### Use vi for helix -> alt-g (lazygit) -> e (edit file) integration. helix inception doesn't work.
if command -q vi
    set -gx EDITOR vi
end
