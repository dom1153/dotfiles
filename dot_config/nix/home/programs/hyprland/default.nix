{pkgs, ...}: {
  imports = [
    ../gtk.nix
    ../qt.nix
    ./ags.nix
  ];

  home.packages = with pkgs; [
    libsForQt5.dolphin
  ];
}
