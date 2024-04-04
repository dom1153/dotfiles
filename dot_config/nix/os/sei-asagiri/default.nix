{inputs, ...}: {
  imports = [
    inputs.home-manager.nixosModules.default
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t460

    ../../system/core/boot.nix
    ../../system/core/dualboot-time.nix
    ../../system/core/locale.nix
    ../../system/core/users.nix

    ../../system/hardware/bluetooth.nix
    ../../system/hardware/qmk.nix

    ../../system/network

    ../../system/nix

    ../../system/programs/fonts.nix
    ../../system/programs/steam.nix
    ../../system/programs/zsh.nix
    ../../system/programs/fish.nix

    ../../system/services/avahi.nix
    ../../system/services/doas.nix
    ../../system/services/home-manager.nix
    ../../system/services/kmscon.nix
    ../../system/services/openssh.nix
    ../../system/services/pulseaudio.nix
    ../../system/services/syncthing.nix
    ../../system/services/tailscale.nix
    ../../system/services/udev.nix
    # ../../system/services/xfce.nix
    ../../system/services/gnome.nix
    ../../system/services/xserver.nix

    ./services/nfs.nix

    ./hardware-configuration.nix
  ];

  ### Builds home-manager with nixos-rebuild
  home-manager.users."archoo" = import ../../home/profiles/sei-asagiri;

  networking = {
    hostName = "sei-asagiri";
    ### LocalSend:
    ###   TCP 53317
    firewall.allowedTCPPorts = [
      53317
    ];
    firewall.allowedUDPPorts = [];

    extraHosts = ''
      100.118.241.111 alma-armas-tail
    '';
  };

  ### note: efi partition baby-sized (configLimit is only visiual)
  boot.loader.systemd-boot.configurationLimit = 3;

  ### xfce works with pulseaudio not pipewire
  # hardware.pulseaudio.package = pkgs.pulseaudioFull;
  # nixpkgs.config.pulseaudio = true;

  services.syncthing = {
    dataDir = "/home/archoo/Documents"; # Default folder for new synced folders
    configDir = "/home/archoo/Documents/.config/syncthing"; # Folder for Syncthing's settings and keys
  };

  ### for vscode
  services.gnome.gnome-keyring.enable = true;

  services.xserver = {
    # videoDrivers = [];
    displayManager.autoLogin.enable = true;
    # displayManager.defaultSession = "xfce";
    libinput.touchpad.disableWhileTyping = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
