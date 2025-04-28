{ config, inputs, lib, ... }: {
  boot = {
    initrd.systemd.enable = true;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      configurationLimit = 5;
    };
  };

  time.timeZone = "America/Chicago";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
  };

  users.users.archoo = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  networking.networkmanager.enable = true;

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = (lib.mapAttrs (_: flake: {
      inherit flake;
    })) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = [ "/etc/nix/path" ];

    settings = {
      ### seeing issues on darwin upstream https://github.com/NixOS/nix/issues/7273
      auto-optimise-store = false;
      experimental-features = "nix-command flakes";
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.etc =
    lib.mapAttrs'
      (name: value: {
        name = "nix/path/${name}";
        value.source = value.flake;
      })
      config.nix.registry;

  systemd.extraConfig = ''DefaultTimeoutStopSec=3s'';
}
