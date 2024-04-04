{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../../home

    ../../editors/vim

    ../../terminal/programs

    ../../terminal/shell/zsh.nix
    ../../terminal/shell/fish.nix
  ];

  home = {
    homeDirectory = "/Users/archoo"; ### optional since defined in os folder

    sessionVariables = {
    };

    packages = with pkgs; [
      # ### vscode extension deps
      alejandra
      nil

      darwin.trash

      inputs.archoo-nixvim.packages.${system}.default
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };
}
