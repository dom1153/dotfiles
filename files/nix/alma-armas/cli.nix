{ inputs, pkgs, ... }:
let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in
{
  environment.pathsToLink = [ "/share/fish" ];
  programs = {
    fish.enable = true;
  };

  environment.systemPackages = with pkgs; [
    alejandra
    unstable.atuin
    unstable.bat
    unstable.chezmoi
    difftastic
    distrobox
    eza
    fastfetch
    fd
    unstable.gh
    git
    grc
    unstable.helix
    unstable.just
    unstable.lazydocker
    unstable.lazygit
    lolcat
    mergiraf
    unstable.mosh
    mprocs
    navi
    unstable.nil
    unstable.nixd
    unstable.nixpkgs-fmt
    nushell
    speedtest-cli
    unstable.starship
    tealdeer
    television
    trash-cli
    uutils-coreutils
    wget
    unstable.yazi
    unstable.zellij
    zoxide
  ];
}
