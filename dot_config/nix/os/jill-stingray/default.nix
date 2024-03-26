{inputs, ...}: {
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
    ../../system/programs/hyprland
    ../../system/programs/steam.nix
    ../../system/programs/zsh.nix

    ../../system/services/avahi.nix
    ../../system/services/docker.nix
    ../../system/services/flatpak.nix
    ../../system/services/home-manager.nix
    ../../system/services/kde-plasma.nix
    ../../system/services/kmscon.nix
    ../../system/services/openssh.nix
    ../../system/services/pipewire.nix
    ../../system/services/syncthing.nix
    ../../system/services/udev.nix
    ../../system/services/waydroid.nix
    ../../system/services/xserver.nix

    ./services/mount.nix
    ./services/nfs.nix

    ./hardware-configuration.nix
  ];

  ### Builds home-manager with nixos-rebuild
  home-manager.users."archoo" = import ../../home/profiles/jill-stingray;

  networking = {
    hostName = "jill-stingray";
    ### 53317: LocalSend
    # firewall.enable = false;
    firewall.allowedTCPPorts = [53317];
    firewall.allowedUDPPorts = [53317];
  };

  boot.loader.systemd-boot.configurationLimit = 3;

  services.syncthing = {
    dataDir = "/home/archoo/Documents"; # Default folder for new synced folders
    configDir = "/home/archoo/Documents/.config/syncthing"; # Folder for Syncthing's settings and keys
  };

  services.xserver = {
    videoDrivers = ["amdgpu"];
    displayManager.autoLogin.enable = true;
    displayManager.defaultSession = "hyprland";
    # displayManager.defaultSession = "plasma";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
