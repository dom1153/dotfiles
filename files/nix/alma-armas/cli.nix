{ pkgs, ... }: {
  environment.pathsToLink = [ "/share/fish" ];
  programs = {
    fish.enable = true;
  };

  environment.systemPackages = with pkgs; [
    alejandra
    atuin
    bat
    chezmoi
    difftastic
    distrobox
    eza
    fd
    gh
    git
    grc
    helix
    just
    lazydocker
    lazygit
    lolcat
    mergiraf
    mosh
    mprocs
    navi
    nil
    nixd
    nixpkgs-fmt
    nushell
    serpl
    speedtest-cli
    starship
    tealdeer
    television
    trash-cli
    uutils-coreutils
    wget
    yazi
    zellij
    zoxide
  ];
}
