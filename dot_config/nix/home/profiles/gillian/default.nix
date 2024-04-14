{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../../home

    ../../programs/vim.nix
    # ../../editors/vscode ### I don't think I need this. Should use wsl-server

    ../../cli/programs

    ../../cli/shell/zsh.nix
    ../../cli/shell/fish.nix
  ];

  home = {
    homeDirectory = "/home/archoo";

    sessionVariables = {
    };

    packages = with pkgs; [
      ### vscode dependencies
      alejandra
      nil

      ### cli tools and services
      trashy

      inputs.archoo-nixvim.packages.${system}.default
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };
}
