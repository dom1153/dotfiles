{...}: {
  ### manages homebrew, homebrew itself must be installed manually!
  homebrew = {
    enable = true;
    brews = []; ### likely use nixpkgs instead
    casks = [
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
      ### experimenting
      # "wezterm"
    ];
    taps = [
      "homebrew/cask-fonts"
      "homebrew/cask-versions"
      "localsend/localsend"
      "osx-cross/arm"
    ];
  };
}
