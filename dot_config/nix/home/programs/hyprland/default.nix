{pkgs, ...}: {
  imports = [
    ../gtk.nix
    ../qt.nix
  ];

  home.packages = with pkgs; [
    libsForQt5.dolphin
    # kdePackages.dolphin
  ];
}
