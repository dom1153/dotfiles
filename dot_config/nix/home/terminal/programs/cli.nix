{pkgs, ...}: {
  home.packages = with pkgs; [
    ### unix alternative
    bat
    btop
    diff-so-fancy
    eza
    fd
    fzf
    ripgrep
    unrar
    unzip
    zip
    zoxide

    ### tools
    chezmoi
    speedtest-cli
    wget
    ### fast-cli ### does not work on darwin

    ### services
    entr
    mosh
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
    navi
    nap ### snippet manager
    ncdu
    neofetch
    zellij
  ];
}
