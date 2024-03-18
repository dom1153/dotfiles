{pkgs, ...}: {
  home.packages = with pkgs; [
    ### gui services
    bazecor ### seems to be bugged
    font-manager
    qbittorrent

    ### gui art
    drawpile
    blender
    # krita

    ### gui apps
    signal-desktop ### limited ot 5 devices

    ### cli tools and services
    thefuck
    trash-cli

    ### tui
    nitch
    ranger
    ttyper
  ];
}
