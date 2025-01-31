switch (uname)
    case Darwin
        ### FYI, commonly added in ~/.zprofile (if debugging PATH)
        if test -f /opt/homebrew/bin/brew
            eval "$(/opt/homebrew/bin/brew shellenv)"
        end

        # rust if it exists via rustup
        fish_add_path -a "$HOME/.cargo/bin"

        # Add Visual Studio Code (code)
        fish_add_path -a "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

        ### prioritize nixos bin over homebrew bin (e.g. neovim)
        fish_add_path -p "/etc/profiles/per-user/$USER/bin"

        ### podman cli (via official installer)
        fish_add_path -p /opt/podman/bin

        ### uv package manager (posting cli)
        fish_add_path -p ~/.local/share/../bin
    case '*'
end
