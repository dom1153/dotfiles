{...}: {
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
}
