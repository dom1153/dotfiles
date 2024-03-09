{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    alejandra
    bat
    cheat
    chezmoi
    darwin.trash
    eza
    gh
    lf
    neofetch
    ponysay
    ranger
    ripgrep
    starship
    tldr
    ttyper
    wget
    zellij
    zoxide

    ### misc
    #terminal-colors
    #pyenv
    #python3
    #yt-dlp
    #mosh
  ];
}
