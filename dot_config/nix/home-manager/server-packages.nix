{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ 
    ### cli tools and services
    bat
    chezmoi
    eza
    fzf
    gh
    ripgrep
    starship
    trash-cli
    zoxide

    ### tui apps
    fastfetch
    mc
    ncdu    ### ncurses du (disk management)
    neofetch
    neovim
    nitch
    ranger
    ttyper
    vim
    zellij
  ];
}
