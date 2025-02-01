{
  pkgs,
  inputs,
  ...
}: let
  stable = import inputs.nixpkgs-stable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in {
  home.packages = with pkgs; [
    ### unix alternative
    stable.bat
    stable.btop
    delta ### git diff specifically
    diff-so-fancy
    stable.eza
    unstable.fd
    unstable.fzf
    stable.glow ### fancy md file reading
    stable.grc ### generic colorizer ; aliases colorize common unix commands
    micro ### nano alternative
    unstable.ripgrep
    tailspin ### tail but its got colors (tspin)
    unrar
    unzip
    zip
    stable.zoxide
    stable.rsync ### pre-installed on nix and darwin, but let's keep it consistent
    file ### get... file types e.g. mime; use with lf preview

    ### tools
    asciinema
    ### asciinema-agg ### generate asciinema gifs
    ### asciinema-scenario ### asciinema from text file; linux only
    stable.chezmoi
    unstable.nix-prefetch-github
    unstable.nh ### yet another nix cli helper (also see nvd and nix-output-monitor)
    unstable.nix-output-monitor ### nix but gives the cool dependency graph
    unstable.nvd ### diff pix package versions
    spacer ### append lines after a given time in tail
    unstable.speedtest-cli
    stable.wget
    ### fast-cli ### does not work on darwin
    unstable.chafa ### sixel (lf)
    unstable.timg ### image viewer fallback when sixel doesn't work
    stable.trurl ### transpose url (get url parts)
    stable.imagemagick ### convert images (e.g. use with kitty icat)
    unstable.lsix ### ls, but for sixel (it's just a shell script)
    unstable.ueberzugpp ### sixel (hook)
    unstable.jq ### parse / query json
    unstable.htmlq ### parse / query json
    unstable.dasel ### yq but different
    unstable.yq-go ### jq but for xml,cvs,toml too (prefer go > python version)
    unstable.pup ### query html
    unstable.devenv ### better dev enviroments?
    # direnv ### auto load env (nix shell, devenv)
    unstable.vhs ### tool to create terminal gifs with code
    unstable.t-rec ### geenrate animated gifs for the web (rust)
    unstable.xdg-ninja ### check $HOME for unwanted files/directories and move them
    unstable.fpp ### facebook pathpicker (edit or run commands on path of ouptut)
    unstable.cz-cli ### commitizen standizing commits
    unstable.gitmoji-cli ### emoji based commit (simple?)
    unstable.tree ### generate a ls tree
    unstable.duf ### df alternative
    unstable.sd ### sed alternative
    unstable.procs ### ps alternative
    unstable.curlie ### curl alternative
    unstable.dust ### du alternative
    unstable.just ### command line runner (like make)
    unstable.watchexec ### generic watch command
    unstable.degit ### git without the .git
    unstable.alejandra ### nix formatter
    unstable.atuin ### magical shell history
    unstable.httpie ### the cooler wget, faster than httpie
    unstable.curlie ### go based curl
    unstable.xh ### the cooler wget, faster than httpie
    unstable.kondo ### clean node_modules and other build files
    unstable.difftastic ### clean node_modules and other build files
    unstable.mprocs ### batch file rename
    unstable.gitnr ### generate git ignore files

    ### funni
    stable.blahaj
    stable.lolcat # keeping this for legacy (lf) reasons ; can remove eventually
    stable.neo-cowsay
    stable.ponysay
    stable.pokemonsay
    stable.fortune
    stable.cmatrix
    stable.cbonsai
    stable.clolcat # lolcat but faster
    stable.peaclock # TODO: needs locale fix on darwin ; would need rebuild for osx it seems
    stable.tenki ### tty-clock with weather effect
    #### tty-clock ### does not work on osx (brew)
    stable.pipes-rs
    stable.figlet ### making large letters out of ordinary letters
    stable.sl ### steam locomotive for when you mistype ls
    stable.fastfetch
    stable.neofetch
    unstable.astroterm ### celestial viewer for the terminal
    stable.onefetch

    ### services
    stable.entr ### run arbitrary commands when files change
    mosh
    stable.starship
    stable.watchman ### for chezmoi

    ### cheatsheets
    stable.cheat
    stable.tealdeer ### rust version compliant with  tldr client
    # tldr

    ### development
    stable.shfmt ### unsure how to integrate
    stable.gum ### shell bubbletea

    ### tui
    unstable.ani-cli
    unstable.helix
    stable.lazygit
    stable.lf
    stable.mc
    unstable.nap ### snippet manager
    stable.navi
    stable.ncdu
    stable.tmux
    unstable.yazi ### another lf ; batteries included
    stable.zellij
    stable.lazydocker
    unstable.television
    unstable.jless ### json pager
    unstable.calcure ### calendar
    unstable.calcurse ### calendar

    # stable.posting ### does not exist
    ### browsh ### firefox, in the terminal
  ];
}
