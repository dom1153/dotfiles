{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ### cli tools and services
    alejandra
    bat
    chezmoi
    eza
    fzf
    gh
    ripgrep
    starship
    trash-cli
    xclip
    zoxide

    ### tui apps
    fastfetch
    mc
    ncdu
    neofetch
    neovim
    nitch
    ranger
    ttyper
    vim
    zellij
  ];
}
