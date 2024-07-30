{
  inputs,
  pkgs,
  ...
}: let
  unstable = import inputs.nixpkgs-unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
in {
  home.packages = with pkgs; [
    ### services
    eww
    localsend
    neovide
    parsec-bin

    ### tools
    vial
    mpv
    spotify
    imv ### image viewer
    feh ### image previewer

    ### art
    libsForQt5.kolourpaint ### windows 98 style

    ### terminal emulators
    kitty
    foot
    cool-retro-term
    wezterm ### not working well with hyprland wayland (x11 works) ; use for other platforms

    ### apps
    discord
    microsoft-edge
    firefox
    unstable.obsidian
    osu-lazer-bin
    anki-bin

    gnome.gnome-disk-utility

    appimage-run ### the main workaround for appimages /shrug

    godot_4

    cura ### ultimaker cura ; 3d slicer
    prusa-slicer ### open source 3d slicer
  ];

  # (with pkgs; [
  #   # list of stable packages go here
  # ])
  #
  # ++
  #
  # (with pkgs-unstable; [
  #   # list of unstable packages go here
  # ]);
}
