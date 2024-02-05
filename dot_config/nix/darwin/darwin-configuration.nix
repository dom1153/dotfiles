### 'Determinate Systems' nixpkgs installer -> nix-darwin
{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [ 
    ### cli
    cheat
    chezmoi
    curlFull
    gh
    darwin.trash
    git
    kbt
    neofetch
    neovim
    tldr
    ponysay
    qmk
    ranger
    tmux
    tmuxinator
    ttyper
    wget
    zellij

    ### misc
    #corepack_21 ### npm
    #eza
    #terminal-colors
    #pyenv
    #python3
    #yt-dlp
    #mosh
  ];

  ### darwin-rebuild switch -I darwin-config=$HOME/.config/nix/darwin/darwin-configuration.nix
  environment.darwinConfig = "$HOME/.config/nix/darwin/darwin-configuration.nix";

  ### manages homebrew, homebrew itself must be installed manually!
  homebrew = {
    enable = true;
    brews = [ ### likely use nixpkgs instead
    ];
    casks = [
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
      "alacritty"
      "alfred"
      "alt-tab"
      "anydesk"
      "arc"
      "bazecor"
      "bartender"
      "betterdisplay"
      "bitwarden"
      "codux"
      "discord"
      "docker"
      "drawpile"
      "duckduckgo"
      "figma"
      "firefox-developer-edition"
      "font-meslo-lg-nerd-font"
      "font-monaspace"
      "google-chrome"
      "iterm2"
      "karabiner-elements"
      "kitty"
      "logi-options-plus"
      "macvim"        ### enables gvim, does not seem to install as seperate mac app...
      "microsoft-edge"
      "mos"
      "obsidian"
      "parsec"
      "processing"
      "qbittorrent"
      "qmk-toolbox"
      "shortcat"      ### macos keyboard navigation concept
      "signal"
      "spotify"
      "steam"
      "syncthing"
      "tabby"
      "vial"
      "visual-studio-code"
      "vlc"
      "warp"
      "windscribe"
      #"blender"
      #"firefox"
      #"logseq"
      #"playcover-community"
      #"runelite""
      #"sigmaos""
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
  };

  #extra-platforms = aarch64-darwin x86_64-darwin
  ### enable flakes and nix-command
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
