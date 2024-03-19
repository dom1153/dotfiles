{pkgs, ...}: {
  imports = [
    ../../../home

    ../../editors/nixvim
    ../../editors/vim

    ../../terminal/programs

    ../../terminal/shell/zsh.nix
  ];

  home = {
    ### homeDirectory is defined at 'user' level

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
