{pkgs, ...}: {
  home.packages = with pkgs; [
    ### unix alternative
    bat
    eza
    fzf
    fd
    ripgrep
    btop
    diff-so-fancy
    zoxide
    zip
    unzip
    unrar

    ### tools
    chezmoi

    ### services
    entr
    qemu
    quickemu
    quickgui
    starship
    watchman ### for chezmoi

    ### cheatsheets
    cheat
    tldr

    ### development
    gh

    ### tui
    ani-cli
    lazygit
    mc
    ncdu
    neofetch
    zellij
  ];
}
