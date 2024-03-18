{...}: {
  services.plex = {
    enable = true;
    openFirewall = true;
    user = "archoo";
    dataDir = "/run/media/archoo/super-4T/";
  };
}
