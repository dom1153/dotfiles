{...}: {
  ### manages homebrew, homebrew itself must be installed manually!
  homebrew = {
    enable = true;
    brews = []; ### likely use nixpkgs instead
    casks = [
      ### experimental / extra
      "alacritty"
      "alfred"
      "anydesk"
      "bartender"
      "blender"
      "codux"
      "duckduckgo"
      "firefox"
      "karabiner-elements"
      "logseq"
      "openvpn-connect"
      "playcover-nightly" ### community version not good enough at 3.0.0
      "processing"
      "runelite"
      "runjs"
      "shortcat" ### macos keyboard navigation concept
      "tabby"
      "vivaldi"
      "vlc"
      "warp"
      "zed"
      "proton-mail" ### just a web app
    ];
    taps = [
      "PlayCover/playcover"
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
    # wireguard ### use appstore
    # "bitwarden"  ### don't use brew or appstore ; had issues powering off pc due to processing not quitting
    # "windscribe" ### does not seem to add gui, maybe only the vpn aspect
  };
}
