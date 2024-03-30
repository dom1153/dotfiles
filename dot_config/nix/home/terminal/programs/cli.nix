{pkgs, ...}: {
  home.packages = with pkgs; [
    ### unix alternative
    bat
    btop
    diff-so-fancy
    delta ### git diff specifically
    eza
    fd
    fzf
    ripgrep
    unrar
    unzip
    zip
    zoxide
    micro ### nano alternative

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
