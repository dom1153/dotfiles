# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
    ./plasma.nix
    ./pkgs.nix
    # ./myos-configuration.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default
      
      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })

      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
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
    # Enable flakes and new 'nix' command
    experimental-features = "nix-command flakes";
    # Deduplicate and optimize nix store
    #auto-optimise-store = true;
  };

  ### type ntfs3 stopped working at some point??? use regular ntfs
  boot.supportedFilesystems = [ "ntfs" ];
  fileSystems."/run/media/archoo/DomData" =
  {
    device = "/dev/sda2";
    fsType = "ntfs";
    options = [
      "nofail"
    ];
  };

  # enable gpu drivers
  services.xserver.videoDrivers = [ "amdgpu" ];

  # host name
  networking.hostName = "artpro";
  networking.networkmanager.enable = true;

  # boot manager
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  ### let clock work with windows
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
      extraGroups = ["networkmanager" "wheel"];
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = false; ### not to be confused with autocomplete
    autosuggestions.enable = false;
    # zsh-autoenv.enable = true;
    #syntaxHighlighting.enable = true;
  };
  users.defaultUserShell = pkgs.zsh;

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "archoo";

  services.syncthing = {
      enable = true;
      user = "archoo";
      dataDir = "/home/archoo/Documents";    # Default folder for new synced folders
      configDir = "/home/archoo/Documents/.config/syncthing";   # Folder for Syncthing's settings and keys
  };

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

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
