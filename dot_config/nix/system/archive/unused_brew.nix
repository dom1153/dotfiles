{...}: {
  ### manages homebrew, homebrew itself must be installed manually!
  homebrew = {
    enable = true;
    brews = [
      "ghcup" ### haskell ghc manager
    ]; ### likely use nixpkgs instead
    casks = [
      ### experimental / extra
      "amethyst" ### yabai superior, even without SIP
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
      "knime" ### Software to create and productionise data science
      "sigmaos" ###
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
    # hour blocks : day planner
    # commandone - file manager
    # wireguard ### use appstore
    # "bitwarden"  ### don't use brew or appstore ; had issues powering off pc due to processing not quitting; biometric unlock is buggy via browser extension; auto login / menu bar is buggy sometimes
    # "windscribe" ### does not seem to add gui, maybe only the vpn aspect
  };
}
