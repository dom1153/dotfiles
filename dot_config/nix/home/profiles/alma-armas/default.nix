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
    homeDirectory = "/home/archoo";

    sessionVariables = {
    };

    packages = with pkgs; [
      trash-cli

      inputs.archoo-nixvim.packages.${system}.default
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };
}
