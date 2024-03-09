### 'Determinate Systems' nixpkgs installer -> nix-darwin
{
  # inputs,
  config,
  pkgs,
  ...
}: {
  # imports = [
  #   inputs.nixvim.homeManagerModules.nixvim
  # ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    home-manager

    ### misc
    #terminal-colors
    #pyenv
    #python3
    #yt-dlp
    #mosh
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
    # "bitwarden"  ### use app store version instead for better integration
    # "windscribe" ### does not seem to add gui, maybe only the vpn aspect
    # "tabby"
    # "warp"
  };

  #extra-platforms = aarch64-darwin x86_64-darwin
  ### enable flakes and nix-command
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh = {
    enable = true;
    enableCompletion = false; ### not to be confused with autocomplete
  };

  ### without this it may try to reconfigure nix as x86_64-darwin
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
