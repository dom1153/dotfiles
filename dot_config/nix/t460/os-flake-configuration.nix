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
    ./de.nix
    ./pkgs.nix
    ./hardware-configuration.nix
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

  ### let clock work with windows
  time.hardwareClockInLocalTime = true;

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  programs.zsh = {
    enable = true;
    enableCompletion = false; ### not to be confused with autocomplete
    autosuggestions.enable = false;
    # zsh-autoenv.enable = true;
    #syntaxHighlighting.enable = true;
  };
  users.defaultUserShell = pkgs.zsh;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  #services.xserver.videoDrivers = [ "amdgpu" ];

  nix.settings = {
    # Enable flakes and new 'nix' command
    experimental-features = "nix-command flakes";
    # Deduplicate and optimize nix store
    auto-optimise-store = true;
  };

  # enable gpu drivers
  #services.xserver.videoDrivers = [ "amdgpu" ];

  # host name
  networking.hostName = "t460";
  networking.networkmanager.enable = true;

  # boot manager
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 3;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = false; ### xfce does not like pipewire
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.pulseaudio.package = pkgs.pulseaudioFull;

  services.avahi = {
    enable = false;
    nssmdns = true;
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

  users.users = {
    archoo = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBpCqdq34vYCMrqWxsjFss3Yu5bN4pAsN34H+y1Sgsaoe9hLgjrJ7zFN2TBjIW43C4YpfH5NvOr2pLx8LIaZT0FZh747Q/ze6FYPbOR9Y5K6WE7JDLhuHNlS5l1r1ccKjgfL6NILljaufH4uUk1+YmRt4CKE7taf2xWAho+Mlq3rGrjgOm/Ipm1BF8UNHis/nyISQEqSNxO7ggsjQKL+Ot0RPpv+S7zmNzNg2cgX7PED/Ot0DB6J43SVX9nBTXDyZrw6e9t28y+0JCNOMLW7TeQQoS+i/ZpP5CXaD6+ZHb1f98Z/IMhELdyKR6BApe1u6kGuFz98JTW3Cqdw6p/Xu+Z7a48WkGjOHEKiHf5qRvBx/6zgcJIYy5z7BaDO2CDcTa1vq9pxgordpguo8+Q+Q04loqNWFJKmIK/d046mr29vEs0aQvoZ7WcPI5fEvvjcL5n1XKv+KEqxpEAuoxmRdCh1i9MmnDDH9T+7oGzjl8bvPc+NRbMejga+D+PheCgws= archoo@Dominics-MacBook-Pro.local"
      ];
      # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      ### "users" "networkmanager"
      extraGroups = ["networkmanager" "wheel"];
    };
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "archoo";

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
