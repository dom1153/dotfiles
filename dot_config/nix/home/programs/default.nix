{pkgs, ...}: {
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
    obsidian
    osu-lazer-bin
  ];
}
