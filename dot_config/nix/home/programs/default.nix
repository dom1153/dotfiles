{
  inputs,
  pkgs,
  ...
}: let
  stable = import inputs.nixpkgs-stable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
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
    unstable.vial
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
    unstable.discord
    unstable.microsoft-edge
    unstable.firefox
    unstable.obsidian
    unstable.osu-lazer-bin
    unstable.anki-bin
    unstable.google-chrome

    gnome.gnome-disk-utility

    unstable.appimage-run ### the main workaround for appimages /shrug

    unstable.godot_4

    cura ### ultimaker cura ; 3d slicer (doesn't want to be updated due to python issues)
    prusa-slicer ### open source 3d slicer

    stable.rofi ### window switcher
    stable.qalculate-qt ### calculator

    ### cli (linux only)
    unstable.devcontainer ### run devcontainer from cli -> macos should use brew

    unstable.seafile-client ### seafile-applet (seems to crash a lot)
    ### https://manual.seafile.com/11.0/deploy/start_seafile_at_system_bootup/#seafile-cli-client-optional
    unstable.seafile-shared ### consider systemctl to make this run at startup, or cli
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
