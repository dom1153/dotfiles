{...}: {
  ### not configured correctly
  services.transmission = {
    enable = true;
    home = "/run/media/archoo/super-4T/appdata/transmission";
    openFirewall = true;
  };
}
