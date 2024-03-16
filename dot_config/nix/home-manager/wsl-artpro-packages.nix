{pkgs, ...}: {
  home.packages = with pkgs; [
    ### cli tools and services
    bat
    cheat
    chezmoi
    diff-so-fancy
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

    ### zsh
    zsh-autocomplete
    nix-zsh-completions
    zsh-nix-shell

    ### tui apps
    fastfetch
    mc
    ncdu
    neofetch
    nitch
    ponysay
    ttyper
    zellij

    ### vscode
    alejandra
    nil
  ];
}
