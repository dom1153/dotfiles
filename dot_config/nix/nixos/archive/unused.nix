{
  ### choose default session chosen by lightdm / sddm
  #displayManager.sddm.enable = true;

  ### pkgs
  environment.systemPackages = with pkgs; [
    ### gui services
    authy
    baobab 		### gnome disk usage analyzer, slow. try ncdu
    heroic
    qbittorent
    screenkey		### works with non-wayland apps
    syncthing
    syncthingtray

    ### gui tools
    anki-bin
    itch

    ### gui terminal emulators
    warp-terminal

    ### gui art
    blender-hip
    drawpile
    figma-linux
    gimp-with-plugins
    inkscape

    ### gui development
    docker
    docker-client
    firefox-devedition
    godot_4
    meld
    neovide
    processing
    unityhub

    ### gui apps
    google-chrome
    libreoffice
    vivaldi
    waydroid
    youtube-music

    ### cli tools and services
    bottles
    keymapviz
    steam-tui
    steamPackages.steamcmd
    trashy

    ### tui apps
    calcure
    kbt
    micro
    ncdu    ### ncurses du (disk management)
    peaclock
    pfetch-rs
    pokeget-rs
    ponysay
    screenfetch
    spotify-tui
    typioca
    youtube-tui

    ### cli development
    nodejs_21
    rustc

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
    elisa 	### music player
    gwenview	### image viewer
    okular	### document viewer
    oxygen	### widget apperances or smth
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
