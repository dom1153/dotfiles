{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../../home

    ### No nix vscode installation required, uses vscode-server

    # ../../programs

    ../../terminal/programs/vim.nix
    ../../terminal/programs

    ../../terminal/shell/zsh.nix
    ../../terminal/shell/fish.nix
  ];

  home = {
    homeDirectory = "/home/archoo";

    sessionVariables = {
      EDITOR = "nvim";
    };

    packages = with pkgs; [
      ### vscode dependencies
      alejandra
      nil

      ### cli tools and services
      trashy

      nvim-pkg # kickstar nvim package
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };
}
