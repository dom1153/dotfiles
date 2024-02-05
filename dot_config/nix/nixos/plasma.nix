{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    # Configure keymap in X11
    layout = "us";
    xkbVariant = "";

    desktopManager.plasma5.enable = true;
    ### using lightdm fixes plasma wayland auto-login issue
    displayManager.lightdm.enable = true;
    displayManager.defaultSession = "plasmawayland";
  };

  # Optional, hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
