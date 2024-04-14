{pkgs, ...}: {
  imports = [
    ../wm/gtk.nix
    ../wm/qt.nix
    ../wm/ags.nix
  ];

  home.packages = with pkgs; [
    libsForQt5.dolphin
  ];
}
