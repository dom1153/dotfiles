{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    # ./plasma.nix
    ./hyprland.nix
  ];

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
    };
  };

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix.settings = {
    experimental-features = "nix-command flakes";
    # auto-optimise-store = true;
  };

  ### mount extra drives ; I think we need ntfs-3g for these drives
  boot.supportedFilesystems = ["ntfs" "ntfs-3g"];
  fileSystems."/run/media/archoo/DomData" = {
    device = "/dev/sda2";
    fsType = "ntfs-3g";
    options = [
      "nofail"
      "rw"
    ];
  };

  ### host name
  networking.hostName = "artpro";
  networking.networkmanager.enable = true;

  ### bootloader management
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  # boot.loader.systemd-boot.netbootxyz.enable = false; ### unsure how to use this yet

  ### bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  ### let hardware clock work with windows
  time.hardwareClockInLocalTime = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.avahi = {
    enable = false;
    nssmdns4 = true;
    openFirewall = true;
  };

  # time and language locale
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  ### enable 8bitdo ultimate controller support
  services.udev.extraRules = ''
    ACTION=="add", \
      ATTRS{idVendor}=="2dc8", \
      ATTRS{idProduct}=="3106", \
      RUN+="${pkgs.kmod}/bin/modprobe xpad", \
      RUN+="${pkgs.bash}/bin/sh -c 'echo 2dc8 3106 > /sys/bus/usb/drivers/xpad/new_id'"
  '';

  users.users = {
    archoo = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel" "docker"];
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = false; ### not to be confused with autocomplete
    autosuggestions.enable = false;
  };
  users.defaultUserShell = pkgs.zsh;

  # programs.mosh.enable = true;

  services.syncthing = {
    enable = true;
    user = "archoo";
    dataDir = "/home/archoo/Documents"; # Default folder for new synced folders
    configDir = "/home/archoo/Documents/.config/syncthing"; # Folder for Syncthing's settings and keys
  };

  ### runescape
  services.flatpak.enable = true;

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Forbid root login through SSH.
      PermitRootLogin = "no";
      # Use keys only. Remove if you want to SSH using password (not recommended)
      PasswordAuthentication = false;
    };
  };

  environment.systemPackages = with pkgs; [
    home-manager
  ];

  fonts.packages = with pkgs; [
    #cozette
    dina-font
    monaspace
    (nerdfonts.override {fonts = ["FiraCode" "CascadiaCode"];})
  ];

  ### steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  ### fix udev rules for qmk
  hardware.keyboard.qmk.enable = true;

  ### vnc
  #services.guacamole-server.enable = true;
  #services.guacamole-client.enable = true;
  #services.guacamole-client.enableWebserver = true;
  #services.x2goserver.enable = true;

  virtualisation.waydroid.enable = true;
  virtualisation.docker.enable = true;

  services.kmscon = {
    enable = true;
    fonts = [
      # {
      #   name = "Monaspace Neon Var Regular";
      #   package = pkgs.monaspace;
      # }
      {
        name = "FiraCode Nerd Font";
        package = pkgs.nerdfonts.override {fonts = ["FiraCode"];};
      }
      # {
      #   name = "dina"; ### wants font-size=10
      #   package = pkgs.dina-font;
      # }
    ];
    hwRender = true;
    # autologinUser = "archoo"; ### only useful running headless
    # font-size=10
    # dpi should be multiples of 96
    # font-dpi=192
    ### catppuccin colors
    extraConfig = ''
      palette=custom
      palette-black=69,71,90
      palette-red=243,139,168
      palette-green=166,227,161
      palette-yellow=249,226,175
      palette-blue=137,180,250
      palette-magenta=245,194,231
      palette-cyan=148,226,213
      palette-light-grey=186,194,222
      palette-dark-grey=88,91,112
      palette-light-red=243,139,168
      palette-light-green=166,227,161
      palette-light-yellow=249,226,175
      palette-light-blue=137,180,250
      palette-light-magenta=245,194,231
      palette-light-cyan=148,226,213
      palette-white=166,173,200
      palette-foreground=205,214,244
      palette-background=30,30,46
      font-dpi=192
    '';
  };
  ### getty == get tty
  #services.getty.autologinUser = "archoo";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
