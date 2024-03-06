{
  config,
  pkgs,
  ...
}: {
  services.xserver.videoDrivers = ["amdgpu"];

  # Set automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = false;
  services.xserver.displayManager.autoLogin.user = "archoo";

  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      # Use keys only. Remove if you want to SSH using password (not recommended)
      PasswordAuthentication = false;
    };
  };

  services.plex = {
    enable = true;
    openFirewall = true;
    user = "archoo";
    dataDir = "/run/media/archoo/super-4T/";
  };

  ### syncthing
  #networking.firewall.allowedTCPPorts = [ 8384 22000 ];
  #networking.firewall.allowedUDPPorts = [ 22000 21027 ];

  services.syncthing = {
    enable = true;
    user = "archoo";
    configDir = "/home/archoo/.config/syncthing";
  };
}
