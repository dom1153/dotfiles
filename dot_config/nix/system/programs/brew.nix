{inputs, ...}: {
  imports = [
    inputs.home-manager.darwinModules.default
  ];

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
      "arc"
      "bazecor"
      "betterdisplay"
      "discord"
      "figma"
      "firefox-developer-edition"
      "font-fira-code-nerd-font"
      "font-meslo-lg-nerd-font"
      "font-monaspace"
      "google-chrome"
      "iterm2"
      "kitty"
      "logi-options-plus"
      "macvim"
      "microsoft-edge"
      "mos" ### mouse wheel
      "obsidian"
      "parsec"
      "processing"
      "qbittorrent"
      "qmk-toolbox"
      "sigmaos"
      "signal"
      "spotify"
      "steam"
      "syncthing"
      "vial"
      "visual-studio-code"
      "vlc"
      # "mpv"
      ### experimental / extra
      "codux"
      "docker"
      "drawpile"
      "duckduckgo"
      "raycast"
      "runjs"
      "shortcat" ### macos keyboard navigation concept
      "zed"
      #"alacritty"
      #"alfred"
      #"anydesk"
      #"bartender"
      #"blender"
      #"firefox"
      #"karabiner-elements"
      #"logseq"
      #"playcover-community"
      #"runelite""
      #"vivaldi""
    ];
    taps = [
      "homebrew/cask-fonts"
      "homebrew/cask-versions"
      "osx-cross/arm"
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
    # "tabby"
    # "warp"
  };
}
