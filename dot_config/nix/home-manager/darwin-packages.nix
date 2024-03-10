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
    diff-so-fancy
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

    ### zsh
    zsh-autocomplete
    nix-zsh-completions
    zsh-nix-shell

    ### misc
    #terminal-colors
    #pyenv
    #python3
    #yt-dlp
    #mosh
  ];
}
