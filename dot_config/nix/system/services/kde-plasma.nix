{pkgs, ...}: {
  services.xserver.desktopManager.plasma5.enable = true;
  # services.desktopManager.plasma6.enable = true;

  # Hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    # konsole
    # oxygen
  ];

  environment.systemPackages = with pkgs; [
    libsForQt5.bismuth ### Making tiling window management easy. On KDE Plasma.
    libsForQt5.plasma-applet-virtual-desktop-bar ### show dots / labels for taskbar
    # kdePackages.yakuake ### drop-down terminal emulator
    xorg.xwininfo
  ];
  ### plugins (e.g. widgets) not found in nix
  ### kde_controlcentre, better inline clock
}
