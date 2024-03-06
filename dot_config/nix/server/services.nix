{
  config,
  pkgs,
  ...
}: {
  ### currently static ip is configured via router

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
  networking.firewall.allowedTCPPorts = [8384 22000];
  networking.firewall.allowedUDPPorts = [22000 21027];

  services.syncthing = {
    enable = true;
    user = "archoo";
    dataDir = "/home/archoo/Syncthing";
    configDir = "/home/archoo/.config/syncthing";
    guiAddress = "10.0.0.227:8384"; ### to access outside of localhost
    overrideDevices = true; ### overrides any devices added or deleted through the WebUI
    overrideFolders = true; ### overrides any folders added or deleted through the WebUI
    settings = {
      devices = {
        "artpro-nixos" = {id = "3WD3GMW-4E27CHO-PG6G5F3-6UB3QQ2-GCSTLTG-JGON3VY-PRLEXMF-XZ4I3QX";};
        "mbp" = {id = "33Y2AMV-ACYLP53-GSOPC4W-V4UFTB3-XVH23C7-BC7UGZI-ITVBKQS-3NST4QY";};
      };
      folders = {
        "SyncMain" = {
          path = "/run/media/archoo/super-4T/Sync";
          devices = ["artpro-nixos" "mbp"];
          versioning = {
            type = "simple";
          };
        };
        "SyncSmall" = {
          path = "/run/media/archoo/super-4T/SmallSync";
          devices = ["artpro-nixos"];
          versioning = {
            type = "simple";
          };
        };
      };
    };
  };
}
