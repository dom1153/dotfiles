{pkgs, ...}: {
  home.pointerCursor = {
    x11.enable = true;
  };

  gtk = {
    #
    enable = true;
    theme = {
      package = pkgs.kdePackages.breeze-gtk;
      name = "Breeze-Dark";
      ## VVV breaks pop-up windows with vscode :/ (full transparency)
      # name = "Catppuccin-Mocha-Compact-Green-Dark";
      # package = pkgs.catppuccin-gtk.override {
      #   accents = ["green"];
      #   size = "compact"; ### standard|compact
      #   tweaks = ["rimless" "normal"]; ### see Colloid-gtk-theme
      #   variant = "mocha";
      # };
    };

    iconTheme = {
      package = pkgs.kdePackages.breeze-icons;
      name = "Breeze-Dark";
      # package = pkgs.colloid-icon-theme;
      # name = "Colloid";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };

  ### Symlink to `~/.config/gtk-4.0/` folder declaratively for GTK 4 (from catppuccin gtk settings)
  xdg.configFile = {
    # "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    # "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    # "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  environment.etc = {
    "xdg/gtk-2.0".source = ./gtk-2.0;
    "xdg/gtk-3.0".source = ./gtk-3.0;
  };

  home.packages = with pkgs; [
    kdePackages.dolphin
  ];

  ### KDE
  # Application Style Breeze; Plasma Style Breeze;
  # Colors Breeze Dark
  # Decorations Breeze
  # Icons Breeze Dark
  # Cursor Breeze
  # Font Noto Sans (10pt) ; Hack (10pt);

  ### qt testing relate to dolphin
  qt = {
    platformTheme = "gtk3";
    style.name = "adwaita-dark";
  };

  home.file = {
    # ".local/share/zsh/zsh-fast-syntax-highlighting".source = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh-fast-syntax-highlighting";
  };

  # home.packages = with pkgs; [
  # ];
}
