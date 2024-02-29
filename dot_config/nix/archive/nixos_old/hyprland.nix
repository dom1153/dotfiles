{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    # Configure keymap in X11
    layout = "us";
    xkbVariant = "";

    displayManager.defaultSession = "hyprland"; ### does not work with sddm or lightdm afaik
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = false;
  };
  security.polkit.enable = true;

  # Optional, hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
