{...}: {
  ### 8112
  services.deluge = {
    enable = true;
    web = {
      enable = true;
      openFirewall = true;
    };
    dataDir = "/run/media/archoo/super-4T/appdata/deluge";
    # openFirewall = true;
  };

  ### enable label plugin for sonarr
}
