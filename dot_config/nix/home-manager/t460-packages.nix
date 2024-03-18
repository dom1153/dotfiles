{pkgs, ...}: {
  home.packages = with pkgs; [
    ### gui services

    ### gui tools
    mpv

    ### gui terminal emulators
    #alacritty
    #foot

    watchman

    ### gui development
    geany ### plasma kate exists

    ### gui apps
    discord
    microsoft-edge
    firefox
    # obsidian
    # signal-desktop
    spotify
    osu-lazer-bin

    ### cli tools and services
    bat
    cheat
    chezmoi
    eza
    gh
    # git
    ripgrep
    entr
    qmk
    fzf
    starship
    tldr
    trash-cli
    xclip
    xsel
    zoxide

    ### tui apps
    ponysay
    ncdu ### ncurses du (disk management)
    ani-cli
    fastfetch
    mc
    neofetch
    ranger
    tmux
    zellij
    ttyper
    nitch

    ### Hyprland 'must have'
    kitty
  ];
}
