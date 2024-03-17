{pkgs, ...}: {
  services.xserver = {
    enable = true;
    xkb.layout = "us";

    ### need gpu driver (not kernal level), or it'll run awfully.
    videoDrivers = ["amdgpu"];

    # Enable automatic login for the user.
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "archoo";

    ### gdm seems to work!
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };

    desktopManager.plasma6.enable = true;
    displayManager.defaultSession = "hyprland";
  };

  programs.hyprland = {
    enable = true;
  };
  security.polkit.enable = true; ### may be auto-enabled by hyprland package now

  # Optional, hint electron apps to use wayland:
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
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
  ];

  ### for file handling ui
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
}
