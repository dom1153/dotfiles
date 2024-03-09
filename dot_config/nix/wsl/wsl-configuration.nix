{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cheat
    chezmoi
    corepack_21
    nodejs_21
    curlFull
    gh
    kbt
    neofetch
    neovim
    ranger
    tmux
    tmuxinator
    ttyper
    trashy
    vim
    wget
    wslu
    zellij
  ];

  nixpkgs.config.allowUnfree = true;

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  #users.users.nixos.useDefaultShell = true;

  ### fix to make vscode work with wsl remote
  imports = [
    (fetchTarball "https://github.com/nix-community/nixos-vscode-server/tarball/master")
  ];
  services.vscode-server.enable = true;
}
