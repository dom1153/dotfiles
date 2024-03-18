{pkgs, ...}: {
  services.xserver = {
    desktopManager.plasma6.enable = true;
    displayManager.defaultSession = "plasma";
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    oxygen
  ];
}
