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

    ### art
    kolourpaint ### windows 98 style
    pureref

    ### terminal emulators
    kitty
    foot

    ### apps
    discord
    microsoft-edge
    firefox
    obsidian
    osu-lazer-bin
  ];
}
