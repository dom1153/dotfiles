{pkgs, ...}: {
  services.desktopManager.plasma6.enable = true;

  # Hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    # konsole
    # oxygen
  ];
}
