{pkgs, ...}: {
  services.xserver = {
    desktopManager.plasma6.enable = true;
    # displayManager.defaultSession = "plasma";
  };

  # Hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    oxygen
  ];
}
