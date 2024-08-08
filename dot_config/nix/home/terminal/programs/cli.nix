{
  pkgs,
  inputs,
  ...
}: let
  unstable = import inputs.nixpkgs-unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
in {
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
    asciinema
    ### asciinema-agg ### generate asciinema gifs
    ### asciinema-scenario ### asciinema from text file; linux only
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
    # direnv ### auto load env (nix shell, devenv)
    vhs ### tool to create terminal gifs with code
    t-rec ### geenrate animated gifs for the web (rust)
    xdg-ninja ### check $HOME for unwanted files/directories and move them
    fpp ### facebook pathpicker (edit or run commands on path of ouptut)

    ### funni
    blahaj
    lolcat # keeping this for legacy (lf) reasons ; can remove eventually
    neo-cowsay
    ponysay
    pokemonsay
    fortune
    cmatrix
    cbonsai
    clolcat # lolcat but faster
    peaclock # TODO: needs locale fix on darwin ; would need rebuild for osx it seems
    tenki ### tty-clock with weather effect
    #### tty-clock ### does not work on osx (brew)
    pipes-rs
    figlet ### making large letters out of ordinary letters
    sl ### steam locomotive for when you mistype ls
    fastfetch
    neofetch

    ### services
    entr
    mosh
    starship
    watchman ### for chezmoi

    ### cheatsheets
    cheat
    tldr

    ### development
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
    tmux
    yazi ### another lf ; batteries included
    zellij
    ### browsh ### firefox, in the terminal
  ];
}
