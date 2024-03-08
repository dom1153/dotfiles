{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    # Configure keymap in X11
    xkb.layout = "us";

    desktopManager.plasma6.enable = true;
    ### using lightdm fixes plasma wayland auto-login issue
    displayManager.defaultSession = "plasma";
  };

  # Optional, hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
