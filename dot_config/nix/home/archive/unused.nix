{pkgs, ...}: {
  ### choose default session chosen by lightdm / sddm
  #displayManager.sddm.enable = true;

  ### pkgs
  environment.systemPackages = with pkgs; [
    ### gui services
    authy
    baobab ### gnome disk usage analyzer, slow. try ncdu
    bitwarden ### always seems to be logged out...
    gnome.gnome-font-viewer ### too many chefs
    heroic
    qbittorent
    screenkey ### works with non-wayland apps
    syncthing
    syncthingtray
    kdePackages.krdc

    ### gui tools
    anki-bin
    anydesk ### parsec, or cli tools
    itch
    vlc ### mpv is better?
    polybar ### x based status bar

    ### gui terminal emulators
    alacritty ### kitty is better
    warp-terminal
    urxvt
    hyper ### the js terminal
    wezterm ### GPU-accelerated cross-platform terminal emulator

    ### gui art
    blender-hip
    drawpile
    figma-linux
    gimp-with-plugins
    inkscape

    ### gui development
    vscode ### use programs.vscode (fhs)
    docker ### use virtualisation config
    docker-client
    firefox-devedition
    geany ### plasma kate exists
    godot_4
    meld
    neovide
    processing
    unityhub

    ### gui apps
    brave ### use declared firefox with incognito
    google-chrome
    libreoffice
    vivaldi
    waydroid
    youtube-music

    ### cli tools
    gitui ### lazygit - like
    bottles
    fortune
    imagemagick
    keymapviz
    mosh
    qmk ### try flake inside qmk repo
    speedtest-cli
    steam-tui
    steamPackages.steamcmd
    trashy ### I think trash-cli was better?
    xsel ### already have xclip right?
    yt-dlp
    python312Packages.howdoi ### very cool, but marked broken via nixpkgs
    multitail ### seems a more extensive tail, but requires a big terminal size, or gives an annoying warning

    ### tui apps
    terminal-colors
    calcure
    kbt
    micro
    ncdu ### ncurses du (disk management)
    peaclock
    pfetch-rs
    pokeget-rs
    ponysay
    screenfetch
    spotify-tui
    typioca
    youtube-tui
    neovim
    fastfetch
    taskell ### trello in haskell
    vim
    htop
    nmon ### another top
    vtop

    ### cli development
    nodejs_21
    rustc
    pyenv
    python3

    ### other
    fish
    linux-wallpaperengine ### doesn't work with plasma

    ### wallpaper engine
    libsForQt5.qt5.qtwebsockets
    python311Packages.websockets
    qt6.qtwebsockets

    ### lazyvim
    fd
    lazygit
    llvmPackages_9.clangUseLLVM
    ripgrep
    unzip
    vimPlugins.LazyVim

    ### Hyprland 'must have'
    ksnip
    jq ### steam script?

    ### neovim (plugin dependencies)
    cargo
    curl
    fd
    gnumake
    llvmPackages_9.libcxxClang
    nodejs_21
    rustc
    rustfmt
    stylua
    tree-sitter
    unzip
    shfmt

    ### hyprland things?
    dunst
    mako
    pipewire
    wireplumber
    qt6.qtwayland

    ### optionally
    wofi
    hyprpaper
    waybar
  ];

  fonts.packages = with pkgs; [
    google-fonts
    powerline-fonts
    ucs-fonts
  ];

  ### ip:8080/guacamole
  services.guacamole-server = {
    enable = true;
  };
  services.guacamole-client = {
    enable = true;
    enableWebserver = true;
  };

  services = {
    xrdp = {
      enable = true;
      defaultWindowManager = "startplasma-x11";
      openFirewall = true;
    };
  };

  services.x2goserver.enable = true;

  services.cockpit = {
    enable = true;
  };

  virtualisation.waydroid.enable = true;

  services.openssh = {
    enable = true;
    ### prevent password / kb for better security
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
    settings.PermitRootLogin = "yes";
  };

  ### enable hostname.local as an address
  services.avahi = {
    enable = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
    };
  };

  ### exclude kde packages
  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa ### music player
    gwenview ### image viewer
    okular ### document viewer
    oxygen ### widget apperances or smth
    khelpcenter
    konsole
    plasma-browser-integration
    print-manager
  ];

  ### attempt to make bazecor work with dygma defy
  # SUBSYSTEMS=="usb", ATTRS{idVendor}=="35ef", ATTRS{idProduct}=="0012", GROUP="users", MODE="0666"
  services.udev.extraRules = ''
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="1209", ATTRS{idProduct}=="2201", MODE="0666"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="1209", ATTRS{idProduct}=="2200", MODE="0666"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="35ef", GROUP="users", MODE="0666"
    KERNEL=="hidraw*", ATTRS{idVendor}=="35ef", GROUP="users", MODE="0666"
  '';
}
