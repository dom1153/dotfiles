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
    wget

    ### services
    entr
    starship
    watchman ### for chezmoi
    wireguard-tools ### vpn

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
    ncdu
    neofetch
    zellij
  ];
}
