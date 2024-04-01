{
  pkgs,
  config,
  ...
}: {
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
      # package = pkgs.adw-gtk3;
      # name = "adw-gtk3-dark";
      name = "Catppuccin-Mocha-Compact-Green-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["green" "pink"];
        size = "compact"; ### standard|compact
        tweaks = ["rimless"]; ### see Colloid-gtk-theme
        variant = "mocha";
      };
    };

    iconTheme = {
      package = pkgs.kdePackages.breeze-icons;
      name = "Breeze-Dark";
      # package = pkgs.colloid-icon-theme;
      # name = "Colloid";
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

  # Symlink to `~/.config/gtk-4.0/` folder declaratively for GTK 4
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
}
