{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    waybar
    eww
    dunst ### notification daemon
    # mako ### notification daemon (wayland exclusive)
    libnotify ### dependancy for notifier
    mpvpaper
    swww
    wofi
    wl-clipboard
    networkmanagerapplet
    pavucontrol ### pulse audio volume adjust
  ];

  # Hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  ### for file handling ui
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
}
