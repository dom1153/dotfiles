{...}: {
  ### gdm seems best for hyprland autologin (and plasma6)
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  ### this should fix gdm from showing up AFTER autologin (specifically with plymouth)
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
