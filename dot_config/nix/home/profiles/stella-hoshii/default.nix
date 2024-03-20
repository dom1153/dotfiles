{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    # inputs.nixvim.nixDarwinModules.nixvim

    ../../../home

    # ../../editors/nixvim/default-darwin.nix
    ../../editors/nixvim
    ../../editors/vim

    ../../terminal/programs

    ../../terminal/shell/zsh.nix
  ];

  home = {
    homeDirectory = "/Users/archoo";

    sessionVariables = {
    };

    packages = with pkgs; [
      # ### vscode extension deps
      alejandra
      nil

      darwin.trash
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };
}
