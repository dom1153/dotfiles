{
  pkgs,
  config,
  ...
}: {
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 40;
  };

  ### fights with KDE if installed
  gtk = {
    enable = true;
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark";
    };

    iconTheme = {
      package = pkgs.kdePackages.breeze-icons;
      name = "Breeze-Dark";
    };
  };

  ### installing gtk packages via home packages did NOT populate them in nwg-look
  home.packages = with pkgs; [
    nwg-look ### gtk3 settings editor
  ];
}
