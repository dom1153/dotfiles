{inputs, ...}: {
  imports = [
    inputs.home-manager.nixosModules.default

    ../../system/core/boot.nix
    ../../system/core/locale.nix
    ../../system/core/users.nix

    ../../system/network

    ../../system/nix

    ../../system/programs/zsh.nix

    ../../system/services/avahi.nix
    ../../system/services/home-manager.nix
    ../../system/services/kmscon.nix
    ../../system/services/mosh-server.nix
    ../../system/services/openssh.nix
    ../../system/services/plex.nix
    ../../system/services/syncthing.nix

    ./services/mount.nix
    ./services/networking.nix
    ./services/nfs.nix
    ./services/samba.nix
    ./services/syncthing.nix
    ./services/wireguard.nix

    ./hardware-configuration.nix
  ];

  ### Builds home-manager with nixos-rebuild
  home-manager.users."archoo" = import ../../home/profiles/alma-armas;

  # boot.loader.systemd-boot.configurationLimit = 5;

  services.xserver = {
    enable = false; ### we don't need this, so just disable right?
    videoDrivers = ["amdgpu"];
    displayManager.autoLogin.enable = false; ### for running headless
    # desktopManager.xfce.enable = true; ### for trying xrdp
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
