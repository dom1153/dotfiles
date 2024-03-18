{...}: {
  ### gdm seems best for hyprland autologin (and plasma6)
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };
}
