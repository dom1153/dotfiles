{...}: {
  ### manages homebrew, homebrew itself must be installed manually!
  homebrew = {
    enable = true;
    brews = [
      "watchman" ### nix edition does not include watchman-make ; python nix versions are broken as usual
      ### JankyBorders | https://github.com/FelixKratz/JankyBorders
      {
        name = "FelixKratz/formulae/borders";
        restart_service = "changed"; ### register launchd, restart service on version change
      }
      ### services *should be* installed automatically?
      "koekeishiya/formulae/yabai" ### tiling window manager
      "koekeishiya/formulae/skhd" ### global keybinds (and yabai)
      # "spicetify-cli" ### going brew since this will stay up to date
      # "ctpv" ### simple terminal preview (c) -> lf
      # "devcontainer" ### run vscode devcontainer from cli
      # "arduino-cli" ### arduino tools but on cli
      "jnv" ### interactive jq
      "posting" ### postman cli
      "mpv-iina"
    ];
    casks = [
      "aerospace" ### i3 style tiling
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
      "alt-tab"
      "arc"
      "barrier"
      "bazecor"
      "betterdisplay"
      "blockbench"
      "discord"
      "docker"
      "drawpile"
      "figma"
      "font-cozette"
      "font-fira-code-nerd-font"
      "font-meslo-lg-nerd-font"
      "font-monaspace"
      "google-chrome"
      "ghostty"
      "hiddenbar"
      "iterm2"
      "keycastr"
      "kitty"
      "launchpad-manager"
      "localsend"
      "macvim"
      "marta"
      "microsoft-edge"
      "mpv"
      "music-decoy"
      "neovide"
      "obsidian"
      "parsec"
      "qbittorrent"
      "qmk-toolbox"
      "raycast"
      "sigmaos"
      "signal" ### keep installed for launchpad organization
      "spotify"
      "steam"
      "syncthing"
      "vial"
      "visual-studio-code"
      "wezterm"
    ];
    taps = [
      "homebrew/cask-fonts"
      "homebrew/cask-versions"
      "localsend/localsend"
      "nikitabobko/tap" ### aerospace
      "iina/homebrew-mpv-iina" ### mpv alternative for ani-cli
    ];
    ### other: playcover nightly
    ### appstore apps
    ## rcmd - app switcher
    ## unsplash wallpapers
    ## horo - timer
    ## tailscale
    ## flow
    ## pixea - like feh
    ## stickies (slightly-more modern sticky notes)
    ## Screenbrush - macos brush for desktop

    ### temp
    # "maccy" ### clipboard manager
  };
}
