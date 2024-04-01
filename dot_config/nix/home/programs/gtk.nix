{pkgs, ...}: {
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 40;
  };

  ### fights with KDE if installed
  gtk = {
    enable = true;
    theme = {
      # package = pkgs.kdePackages.breeze-gtk;
      # name = "Breeze-Dark";
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark";
    };

    iconTheme = {
      package = pkgs.kdePackages.breeze-icons;
      name = "Breeze-Dark";
    };

    # font = {
    #   name = "Sans";
    #   size = 11;
    # };
  };

  home.packages = with pkgs; [
    nwg-look ### gtk3 settings editor
  ];

  ### KDE
  # Application Style Breeze; Plasma Style Breeze;
  # Colors Breeze Dark
  # Decorations Breeze
  # Icons Breeze Dark
  # Cursor Breeze
  # Font Noto Sans (10pt) ; Hack (10pt);
}
