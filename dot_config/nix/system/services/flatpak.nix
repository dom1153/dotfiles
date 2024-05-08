{...}: {
  imports = [
    ../programs/hyprland/xdg.nix
  ];

  ### runescape / jagex launcher
  services.flatpak.enable = true;
}
