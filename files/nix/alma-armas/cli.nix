{ pkgs, ... }: {
  environment.pathsToLink = [ "/share/zsh" "/share/fish" ];
  programs = {
    zsh.enable = true;
    fish.enable = true;
  };

  environment.systemPackages = with pkgs; [
    alejandra
    atuin
    bat
    chezmoi
    difftastic
    eza
    fd
    gh
    grc
    helix
    just
    lazydocker
    lazygit
    lolcat
    mergiraf
    mise
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
