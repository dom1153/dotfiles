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
    # ../../system/programs/hyprland
    ../../system/programs/steam.nix
    ../../system/programs/zsh.nix
    ../../system/programs/fish.nix

    # ../../system/services/awesomewm.nix

    ../../system/services/avahi.nix
    ../../system/services/docker.nix
    ../../system/services/podman.nix
    ../../system/services/flatpak.nix
    # ../../system/services/doas.nix
    # ../../system/services/gnome.nix
    ../../system/services/kde-plasma.nix
    # ../../system/services/gdm.nix
    ../../system/services/home-manager.nix
    ../../system/services/kmscon.nix
    ../../system/services/openssh.nix
    ../../system/services/pipewire.nix
    ../../system/services/syncthing.nix
    ../../system/services/tailscale.nix
    ../../system/services/udev.nix
    # ../../system/services/waydroid.nix
    ../../system/services/xserver.nix

    ./services/mount.nix
    ./services/nfs.nix
    ./services/caddy.nix
    # ./services/samba.nix

    ./hardware-configuration.nix
  ];

  ### Builds home-manager with nixos-rebuild
  home-manager.users."archoo" = import ../../home/profiles/jill-stingray;

  networking = {
    hostName = "jill-stingray";
    ### LocalSend:
    ###   TCP 53317
    ### Synergy:
    ###   24800?
    # firewall.enable = false;
    firewall.allowedTCPPorts = [
      53317
      24800
      32400 ### plex media server
    ];
    firewall.allowedUDPPorts = [
      24800
    ];
  };

  ### TODO: change back to 3
  boot.loader.systemd-boot.configurationLimit = 3;

  programs.command-not-found.enable = false; # Not working without channel (only shows up with fish)

  programs.noisetorch.enable = true;

  ### Home manager: The name ca.desrt.dconf was not provided by any .service files
  ### https://github.com/nix-community/home-manager/issues/3113
  programs.dconf.enable = true;

  # services.postgresql.enable = true;

  # programs.ssh = {
  #   setXAuthLocation = true;
  #   forwardX11 = true;
  # };

  # mycontainers = {
  #   enable = true;
  #   persistentDataRoot = "/home/archoo/dock/";
  # };

  services.syncthing = {
    dataDir = "/home/archoo/Documents"; # Default folder for new synced folders
    configDir = "/home/archoo/Documents/.config/syncthing"; # Folder for Syncthing's settings and keys
  };

  services.xserver = {
    videoDrivers = ["amdgpu"];
    # displayManager.defaultSession = "hyprland";
  };

  systemd.extraConfig = ''
    DefaultTimeoutStopSec=3s
  '';

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
