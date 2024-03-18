{pkgs, ...}: {
  imports = [
    ../../../home

    ../../editors/nixvim
    ../../editors/vim
    ### TODO: try vscode
    # ../../editors/vscode

    ../../terminal/programs

    ../../terminal/shell/zsh.nix

    ./brew.nix
  ];

  home = {
    homeDirectory = "/Users/archoo";

    sessionVariables = {
    };

    packages = with pkgs; [
      # ### vscode deps
      # alejandra
      # nil

      darwin.trash
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };
}
