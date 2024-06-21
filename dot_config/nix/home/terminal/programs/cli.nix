{pkgs, ...}: {
  home.packages = with pkgs; [
    ### unix alternative
    bat
    btop
    delta ### git diff specifically
    diff-so-fancy
    eza
    fd
    fzf
    glow ### fancy md file reading
    grc ### generic colorizer ; aliases colorize common unix commands
    micro ### nano alternative
    ripgrep
    tailspin ### tail but its got colors (tspin)
    unrar
    unzip
    zip
    zoxide
    rsync ### pre-installed on nix and darwin, but let's keep it consistent
    file ### get... file types e.g. mime; use with lf preview

    ### tools
    chezmoi
    nix-prefetch-github
    spacer ### append lines after a given time in tail
    speedtest-cli
    wget
    ### fast-cli ### does not work on darwin
    chafa ### sixel (lf)
    ctpv ### simple terminal preview (but in c)
    trurl ### transpose url (get url parts)

    ### funni (keep these)
    lolcat
    neo-cowsay
    ponysay
    pokemonsay
    fortune
    cmatrix
    peaclock # TODO: needs locale fix on darwin

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
    lf
    mc
    nap ### snippet manager
    navi
    ncdu
    neofetch
    tmux
    zellij
    ### browsh ### firefox, in the terminal
  ];
}
