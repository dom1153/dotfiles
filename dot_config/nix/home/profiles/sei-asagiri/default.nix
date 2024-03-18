{pkgs, ...}: {
  imports = [
    ../../../home

    ../../editors/nixvim
    ../../editors/vim
    ../../editors/vscode

    ../../programs

    ../../terminal/programs

    ../../terminal/shell/zsh.nix
  ];

  home = {
    sessionVariables = {
    };

    packages = with pkgs; [
      qbittorrent
      trash-cli
      ttyper
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };
}
