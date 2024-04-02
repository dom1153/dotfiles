{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../../home

    ../../editors/vim
    # ../../editors/vscode ### I don't think I need this. Should use wsl-server

    ../../terminal/programs

    ../../terminal/shell/zsh.nix
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
      # trash-cli
      trashy

      inputs.archoo-nixvim.packages.${system}.default
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };
}
