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
      "spicetify-cli" ### going brew since this will stay up to date
      # "ctpv" ### simple terminal preview (c) -> lf
    ];
    casks = [
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
      "firefox-developer-edition"
      "font-cozette"
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
    ## pixea - like feh

    # "ultimaker-cura" ### 3d slicer
    # "prusaslicer" ### open source 3d slicer
    ### "xnviewmp" ### xn viewer mpv -> looks ugly...
  };
}
