{...}: {
  ### manages homebrew, homebrew itself must be installed manually!
  homebrew = {
    enable = true;
    brews = []; ### likely use nixpkgs instead
    casks = [
      ### essential
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
      "alt-tab"
      "amethyst"
      "arc"
      "bazecor"
      "betterdisplay"
      "discord"
      "docker"
      "drawpile"
      "figma"
      "firefox-developer-edition"
      "font-fira-code-nerd-font"
      "font-meslo-lg-nerd-font"
      "font-monaspace"
      "google-chrome"
      "hiddenbar"
      "iterm2"
      "kitty"
      "launchpad-manager"
      "localsend"
      "logi-options-plus"
      "macvim"
      "microsoft-edge"
      "mos" ### mouse wheel
      "mpv"
      "neovide"
      "obsidian"
      "parsec"
      "proton-mail"
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
      ### experimental / extra
      # "alacritty"
      # "alfred"
      # "anydesk"
      # "bartender"
      # "blender"
      # "codux"
      # "duckduckgo"
      # "firefox"
      # "karabiner-elements"
      # "logseq"
      # "openvpn-connect"
      # "playcover-nightly" ### community version not good enough at 3.0.0
      # "processing"
      # "runelite"
      # "runjs"
      # "shortcat" ### macos keyboard navigation concept
      # "tabby"
      # "vivaldi""
      # "vlc"
      # "warp"
      # "zed"
    ];
    taps = [
      "homebrew/cask-fonts"
      "homebrew/cask-versions"
      "localsend/localsend"
      "osx-cross/arm"
      # "PlayCover/playcover"
    ];
    ### excluded due to not existing on homebrew or on appstore
    # Aesprite
    # Authy
    # BetterSnapTool
    # CompareMerge2
    # Google Chrome Developer Edition
    # IntelliJ IDEA CE
    # Pixea
    # Proton Mail Bridge
    # Sidekick (browser)
    # Shirabe Jisho
    # Synergy
    # "bitwarden"  ### don't use brew or appstore ; had issues powering off pc due to processing not quitting
    # "windscribe" ### does not seem to add gui, maybe only the vpn aspect
    # wireguard ### use appstoreß
  };
}
