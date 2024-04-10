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

    ### tools
    chezmoi
    speedtest-cli
    wget
    nix-prefetch-github
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
