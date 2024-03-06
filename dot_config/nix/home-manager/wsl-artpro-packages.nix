{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ### cli tools and services
    alejandra
    bat
    cheat
    chezmoi
    entr
    eza
    fzf
    gh
    ripgrep
    starship
    tldr
    trashy
    wget ### required for vscode server
    wslu
    xclip
    xsel
    zoxide

    ### tui apps
    fastfetch
    mc
    ncdu
    neofetch
    neovim
    nitch
    ponysay
    ttyper
    vim
    zellij
  ];
}
