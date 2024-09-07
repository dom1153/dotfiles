{
  inputs,
  pkgs,
  ...
}: let
  unstable = import inputs.nixpkgs-unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };

  zen-browser = pkgs.callPackage ../../programs/pkgs/zen-browser.nix {};
in {
  imports = [
    ../../../home

    ../../programs
    # ../../programs/hyprland
    ../../programs/vscode.nix
    # ../../programs/mime.nix
    # ../../programs/gnome.nix

    ../../terminal/programs
    ../../terminal/programs/qemu.nix

    ../../terminal/shell/zsh.nix
    ../../terminal/shell/fish.nix
    ../../terminal/shell/nushell.nix

    ../../terminal/programs/vim.nix
  ];

  home = {
    homeDirectory = "/home/archoo";

    sessionVariables = {
      EDITOR = "nvim";
    };

    packages = with pkgs; [
      zen-browser

      qbittorrent
      nitch
      trash-cli
      ttyper

      nix-prefetch-github ### for the dumb nixos stuff

      nvim-pkg # kickstar nvim package
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };
}
