{
  config,
  pkgs,
  ...
}: {
  ### for pulseaudio fixes?
  nixpkgs.config.pulseaudio = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    # Configure keymap in X11
    layout = "us";
    xkbVariant = "";

    ### using lightdm fixes plasma wayland auto-login issue
    #displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
    #desktopManager.plasma5.enable = true;
    #desktopManager.budgie.enable = true;
    #desktopManager.pantheon.enable = true;
    #desktopManager.cinnamon.enable = true;
    #desktopManager.mate.enable = true;
    #desktopManager.lxqt.enable = true;
    #desktopManager.enlightenment.enable = true;
    #desktopManager.gnome.enable = true;
    #displayManager.defaultSession = "plasmawayland";
  };

  # Optional, hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
