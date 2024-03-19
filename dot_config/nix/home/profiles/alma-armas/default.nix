{pkgs, ...}: {
  imports = [
    ../../../home

    ../../editors/nixvim
    ../../editors/vim

    ../../terminal/programs

    ../../terminal/shell/zsh.nix
  ];

  home = {
    homeDirectory = "/home/archoo";

    sessionVariables = {
    };

    packages = with pkgs; [
      trash-cli
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };
}
