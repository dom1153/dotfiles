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
    ../../system/services/openssh.nix
    ../../system/services/plex.nix
    ../../system/services/syncthing.nix

    ./hardware-configuration.nix
    ./mount.nix
  ];

  ### Builds home-manager with nixos-rebuild
  home-manager.users."archoo" = import ../../home/profiles/alma-armas;

  networking = {
    hostName = "alma-armas";
    ### Syncthing Gui:
    ###   TCP 8384 22000
    ###   UDP 21027 22000
    ### NFS:
    ###   TCP 2049 111 2049 4000 4001 4002 20048
    ###   UDP 111 2049 4000 4001 4002 20048
    firewall = {
      allowedTCPPorts = [
        111
        20048
        2049
        2049
        22000
        4000
        4001
        4002
        8384
      ];
      allowedUDPPorts = [
        111
        20048
        2049
        21027
        22000
        4000
        4001
        4002
      ];
    };
  };

  # boot.loader.systemd-boot.configurationLimit = 5;

  services.syncthing = {
    enable = true;
    dataDir = "/home/archoo/Syncthing";
    configDir = "/home/archoo/.config/syncthing";
    guiAddress = "10.0.0.227:8384"; ### to access outside of localhost
    overrideDevices = true; ### overrides any devices added or deleted through the WebUI
    overrideFolders = true; ### overrides any folders added or deleted through the WebUI
    settings = {
      devices = {
        "artpro-nixos" = {id = "3WD3GMW-4E27CHO-PG6G5F3-6UB3QQ2-GCSTLTG-JGON3VY-PRLEXMF-XZ4I3QX";};
        "artpro-win10" = {id = "LOWXFPP-B3YISYP-AIUCF7P-F5SNDNZ-RYBF23K-K5MXEXZ-Z6ZQ7GU-X56L7QO";};
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

  services.xserver = {
    videoDrivers = ["amdgpu"];
    displayManager.autoLogin.enable = false; ### headless
    # desktopManager.xfce.enable = true; ### for trying xrdp
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
