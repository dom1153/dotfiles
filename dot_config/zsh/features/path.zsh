shellos="UNKNOWN OS"
case $(uname) in
  Darwin)
    ### FYI, commonly added in ~/.zprofile (if debugging PATH)
    if [ -f /opt/homebrew/bin/brew ]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    # rust if it exists via rustup
    export PATH="$PATH:$HOME/.cargo/bin"

    # Add Visual Studio Code (code)
    export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

    ### prioritize nixos bin over homebrew bin (e.g. neovim)
    # export PATH="$HOME/.nix-profile/bin:$PATH"
    export PATH="/etc/profiles/per-user/$USER/bin:$PATH"

    shellos="MAC"
    ;;
  Linux)
    ;;
esac

