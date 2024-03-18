{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.default

    ../../system/core/boot.nix
    ../../system/core/dualboot-time.nix
    ../../system/core/locale.nix
    ../../system/core/users.nix

    ../../system/hardware/bluetooth.nix
    ../../system/hardware/qmk.nix

    ../../system/network

    ../../system/nix

    ../../system/programs/fonts.nix
    ../../system/programs/xdg.nix
    ../../system/programs/zsh.nix

    ../../system/services/avahi.nix
    ../../system/services/flatpak.nix
    ../../system/services/home-manager.nix
    ../../system/services/openssh.nix
    ../../system/services/pipewire.nix
    ../../system/services/syncthing.nix
    ../../system/services/udev.nix

    ./hardware-configuration.nix
    ./mount.nix
  ];

  ### Builds home-manager with nixos-rebuild
  home-manager.users."archoo" = import ../../home-manager/nixos-home.nix;

  networking.hostName = "jill-stingray";

  boot.loader.systemd-boot.configurationLimit = 5;

  services.syncthing = {
    dataDir = "/home/archoo/Documents"; # Default folder for new synced folders
    configDir = "/home/archoo/Documents/.config/syncthing"; # Folder for Syncthing's settings and keys
  };

  services.xserver = {
    videoDrivers = ["amdgpu"];
    desktopManager.plasma6.enable = true;
    displayManager.defaultSession = "hyprland"; ### alt: "plasma"
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
