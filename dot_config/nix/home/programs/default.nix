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
    # unstable.localsend ### conflicts with rustdesk
    unstable.parsec-bin
    unstable.rustdesk-flutter
    eww
    xdragon ### drag and drop files (x server)

    ### tools
    unstable.spotify
    neovide
    vial
    mpv
    imv ### image viewer
    feh ### image previewer
    losslesscut-bin
    meld ### folder comparison ; can't find preferences folder qq
    stable.postman ### REST
    unstable.code-cursor ### ai powered ide
    unstable.zed-editor

    ### art
    stable.blockbench ### voxel 3d modeling
    libsForQt5.kolourpaint ### windows 98 style

    ### terminal emulators
    unstable.kitty
    unstable.foot
    cool-retro-term
    stable.wezterm ### not working well with hyprland wayland (x11 works) ; use for other platforms
    unstable.ghostty

    ### apps
    discord
    microsoft-edge
    firefox
    unstable.obsidian
    unstable.osu-lazer-bin
    unstable.anki-bin
    google-chrome

    gnome.gnome-disk-utility

    unstable.appimage-run ### the main workaround for appimages /shrug

    unstable.godot_4

    cura ### ultimaker cura ; 3d slicer (doesn't want to be updated due to python issues)
    prusa-slicer ### open source 3d slicer

    stable.rofi ### window switcher
    stable.qalculate-qt ### calculator

    ### cli (linux only)
    unstable.devcontainer ### run devcontainer from cli -> macos should use brew
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
