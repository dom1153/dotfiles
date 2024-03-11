{
  config,
  pkgs,
  ...
}: {
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    # Configure keymap in X11
    xkb.layout = "us";

    desktopManager.plasma6.enable = true;
    ### using lightdm fixes plasma wayland auto-login issue
    displayManager.defaultSession = "plasma";
  };

  ### works in theory, but probably have to disable default session or something...
  services.xrdp = {
    enable = false;
    defaultWindowManager = "startplasma-wayland";
    openFirewall = true;
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
  ];

  # Optional, hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
