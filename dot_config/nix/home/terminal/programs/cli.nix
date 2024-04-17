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
    glow ### fancy md file reading
    tailspin ### tail but its got colors (tspin)

    ### tools
    chezmoi
    speedtest-cli
    wget
    nix-prefetch-github
    spacer ### append lines after a given time in tail
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
    shfmt ### unsure how to integrate

    ### tui
    ani-cli
    helix
    lazygit
    mc
    nap ### snippet manager
    navi
    ncdu
    neofetch
    zellij
  ];
}
