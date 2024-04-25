{...}: {
  ### manages homebrew, homebrew itself must be installed manually!
  homebrew = {
    enable = true;
    brews = [
      "watchman" ### nix edition does not include watchman-make ; python nix versions are broken as usual
      "FelixKratz/formulae/borders" ### JankyBorders | https://github.com/FelixKratz/JankyBorders
      "koekeishiya/formulae/yabai" ### tiling window manager
    ];
    casks = [
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
      "alt-tab"
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
      "tyke" ### status bar notepad
      "vial"
      "visual-studio-code"
      "wezterm"
    ];
    taps = [
      "homebrew/cask-fonts"
      "homebrew/cask-versions"
      "localsend/localsend"
      ### "osx-cross/arm"
    ];
    ### other: playcover nightly
    ### appstore apps
    ## rcmd - app switcher
    ## unsplash wallpapers
    ## horo - timer
    ## tailscale
    ## flow
  };
}
