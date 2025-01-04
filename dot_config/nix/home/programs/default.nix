{
  inputs,
  pkgs,
  ...
}: let
  stable = import inputs.nixpkgs-stable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
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
    postman ### REST
    unstable.code-cursor ### ai powered ide
    unstable.zed-editor

    ### art
    blockbench ### voxel 3d modeling
    libsForQt5.kolourpaint ### windows 98 style

    ### terminal emulators
    kitty
    foot
    cool-retro-term
    wezterm ### not working well with hyprland wayland (x11 works) ; use for other platforms
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

    appimage-run ### the main workaround for appimages /shrug

    godot_4

    cura ### ultimaker cura ; 3d slicer
    prusa-slicer ### open source 3d slicer

    rofi ### window switcher
    qalculate-qt ### calculator

    ### cli (linux only)
    ### unix alternative
    unstable.devcontainer ### run devcontainer from cli -> macos should use brew
    stable.bat
    stable.btop
    stable.delta ### git diff specifically
    stable.diff-so-fancy
    stable.eza
    stable.fd
    stable.fzf
    stable.glow ### fancy md file reading
    stable.grc ### generic colorizer ; aliases colorize common unix commands
    stable.micro ### nano alternative
    stable.ripgrep
    stable.tailspin ### tail but its got colors (tspin)
    stable.unzip
    stable.zip
    stable.zoxide
    stable.rsync ### pre-installed on nix and darwin, but let's keep it consistent
    stable.file ### get... file types e.g. mime; use with lf preview

    ### tools
    stable.asciinema
    stable.chezmoi
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
