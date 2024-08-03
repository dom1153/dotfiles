{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.default

    ../../system/core/boot.nix
    ../../system/core/locale.nix
    ../../system/core/users.nix

    ../../system/network

    ../../system/nix

    ../../system/programs/zsh.nix
    ../../system/programs/fish.nix

    ../../system/services/avahi.nix
    ../../system/services/docker.nix
    ../../system/services/home-manager.nix
    ../../system/services/kmscon.nix
    ../../system/services/mosh-server.nix
    ../../system/services/openssh.nix
    ../../system/services/plex.nix
    ../../system/services/syncthing.nix
    ../../system/services/tailscale.nix

    # ./services/acme.nix
    ./services/deluge.nix
    ./services/mount.nix
    ./services/networking.nix
    ./services/nextcloud.nix
    ./services/nfs.nix
    ./services/samba.nix
    ./services/sonarr.nix
    ./services/sws.nix
    ./services/syncthing.nix
    # ./services/openvscode-server.nix

    ./hardware-configuration.nix
  ];

  ### Builds home-manager with nixos-rebuild
  home-manager.users."archoo" = import ../../home/profiles/alma-armas;

  programs.command-not-found.enable = false; # Not working without channel

  #### ssh forwarding test (xauth, xforwarding, xserver; works local, maybe not over tailscale)
  # services.openssh = {
  #   settings = {
  #     X11Forwarding = true;
  #   };
  # };
  #
  # environment.systemPackages = with pkgs; [
  #   xorg.xauth
  # ];
  #
  # programs.ssh = {
  #   setXAuthLocation = true;
  #   forwardX11 = true;
  # };

  boot.loader.systemd-boot.configurationLimit = 5;

  services.xserver = {
    enable = false; ### we don't need this, so just disable right?
    videoDrivers = ["amdgpu"];
    displayManager.autoLogin.enable = false; ### for running headless
    # desktopManager.xfce.enable = true; ### for trying xrdp
  };

  systemd.extraConfig = ''
    DefaultTimeoutStopSec=3s
  '';

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
