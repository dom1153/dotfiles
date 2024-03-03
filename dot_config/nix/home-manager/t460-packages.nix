{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ 
    ### gui services
    bitwarden

    ### gui tools
    vlc

    ### gui terminal emulators
    #alacritty
    #foot

    ### gui development
    geany		### plasma kate exists
    vscode

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
    ncdu    ### ncurses du (disk management)
    ani-cli
    fastfetch
    mc
    neofetch
    neovim
    ranger
    tmux
    zellij
    ttyper
    vim
    nitch

    ### Hyprland 'must have'
    kitty
  ];
}
