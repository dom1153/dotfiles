{
  pkgs,
  inputs,
  ...
}: let
  stable = import inputs.nixpkgs-stable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
  unstable = import inputs.nixpkgs-unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
in {
  home.packages = with pkgs; [
    ### todo make a 'cli old' for macos exclusive that don't fit into brew
    ### the rest shall be cask and 'progrmas'

    ### TODO: macos only wants 2023 (or run brew really for many apps due to exec error)
    ### seperate modules into unix only and shove the rest into brew

    ### unix alternatives
    unrar ### just basic... alright

    ### asciinema-agg ### generate asciinema gifs
    ### asciinema-scenario ### asciinema from text file; linux only
    nix-prefetch-github
    nh ### yet another nix cli helper (also see nvd and nix-output-monitor)
    nix-output-monitor ### nix but gives the cool dependency graph
    nvd ### diff pix package versions
    spacer ### append lines after a given time in tail
    speedtest-cli
    wget
    ### fast-cli ### does not work on darwin
    chafa ### sixel (lf)
    timg ### image viewer fallback when sixel doesn't work
    trurl ### transpose url (get url parts)
    imagemagick ### convert images (e.g. use with kitty icat)
    lsix ### ls, but for sixel (it's just a shell script)
    ueberzugpp ### sixel (hook)
    jq ### parse / query json
    dasel ### yq but different
    yq-go ### jq but for xml,cvs,toml too (prefer go > python version)
    pup ### query html
    devenv ### better dev enviroments?
    # direnv ### auto load env (nix shell, devenv)
    vhs ### tool to create terminal gifs with code
    t-rec ### geenrate animated gifs for the web (rust)
    xdg-ninja ### check $HOME for unwanted files/directories and move them
    fpp ### facebook pathpicker (edit or run commands on path of ouptut)
    cz-cli ### commitizen standizing commits
    gitmoji-cli ### emoji based commit (simple?)
    tree ### generate a ls tree
    duf ### df alternative
    sd ### sed alternative
    procs ### ps alternative
    curlie ### curl alternative
    dust ### du alternative
    just ### command line runner (like make)
    watchexec ### generic watch command
    degit ### git without the .git

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
    tealdeer ### rust version compliant with  tldr client
    # tldr

    ### development
    shfmt ### unsure how to integrate
    gum ### shell bubbletea

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
