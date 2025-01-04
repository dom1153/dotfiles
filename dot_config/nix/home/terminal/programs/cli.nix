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
    ### the ones not compatible with mac
    unrar
    ueberzugpp ### sixel (hook)
    pup ### query html
    devenv ### better dev enviroments?
    cz-cli ### commitizen standizing commits
    degit ### git without the .git
    ### funni
    blahaj
    neo-cowsay
    pokemonsay
    clolcat # lolcat but faster
    peaclock # TODO: needs locale fix on darwin ; would need rebuild for osx it seems
    tenki ### tty-clock with weather effect
    #### tty-clock ### does not work on osx (brew)
    pipes-rs
    neofetch
    ### tui
    ani-cli

    ### asciinema-agg ### generate asciinema gifs
    ### asciinema-scenario ### asciinema from text file; linux only

    ### skipping nix stuff till I have a proper module
    nix-prefetch-github
    nh ### yet another nix cli helper (also see nvd and nix-output-monitor)
    nix-output-monitor ### nix but gives the cool dependency graph
    nvd ### diff pix package versions

    ### browsh ### firefox, in the terminal
  ];
}
