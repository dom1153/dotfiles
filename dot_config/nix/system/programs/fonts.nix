{pkgs, ...}: {
  fonts.packages = with pkgs; [
    #cozette
    dina-font
    monaspace
    (nerdfonts.override {fonts = ["FiraCode" "CascadiaCode"];})
  ];
}
