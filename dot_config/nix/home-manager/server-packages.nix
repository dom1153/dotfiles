{pkgs, ...}: {
  home.packages = with pkgs; [
    ### cli tools and services
    alejandra
    bat
    chezmoi
    diff-so-fancy
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
    nitch
    ranger
    ttyper
    zellij
  ];
}
