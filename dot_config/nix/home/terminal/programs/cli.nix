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
    trurl ### transpose url (get url parts)
    imagemagick ### convert images (e.g. use with kitty icat)
    lsix ### ls, but for sixel
    ueberzugpp ### sixel
    jq ### parse / query json
    devenv ### better dev enviroments?
    direnv ### auto load env (nix shell, devenv)

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
    yazi ### another lf ; batteries included
    zellij
    ### browsh ### firefox, in the terminal
  ];
}
