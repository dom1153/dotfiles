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

        # prioritize homebrew zellij (... file could not be run by the operating system.)
        if test -f /opt/homebrew/bin/zellij
            fish_add_path -p /opt/homebrew/bin/zellij
        end
    case '*'
end
