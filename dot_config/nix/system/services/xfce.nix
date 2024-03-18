{...}: {
  services.xserver = {
    desktopManager.xfce.enable = true;
    displayManager.defaultSession = "xfce";
  };
}
