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
    bat
    btop
    diff-so-fancy
    eza
    fd
    fzf
    glow ### fancy md file reading
    grc ### generic colorizer ; aliases colorize common unix commands
    ripgrep
    unrar
    unzip
    zip
    zoxide
    # rsync ### pre-installed on nix and darwin, but let's keep it consistent
    file ### get... file types e.g. mime; use with lf preview

    ### tools
    chezmoi
    unstable.nix-prefetch-github
    unstable.nh ### yet another nix cli helper (also see nvd and nix-output-monitor)
    unstable.difftastic
    wget

    duf ### df alternative

    ### services
    starship
    watchman ### for chezmoi

    ### development
    gum ### shell bubbletea
    clolcat
    cowsay

    ### tui
    stable.lazygit
    lf
    navi
    ncdu
    zellij
    # lazydocker
    # television
    # lazyjournal
  ];
}
