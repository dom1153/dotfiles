{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    xkb.layout = "us";

    # desktopManager.plasma5.enable = true;
    desktopManager.plasma6.enable = true;
    ### using lightdm fixes plasma wayland auto-login issue
    # displayManager.defaultSession = "plasma"; ### wayland default on plasma6
    # displayManager.defaultSession = "plasmawayland"; ### only for plasma5

    # Enable automatic login for the user.
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "archoo";
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
