{pkgs, ...}: {
  imports = [
    ../../../home

    ### surround nvim broken???
    ### (per documentation this means nixpkgs and nixvim are out of date)
    ### https://nix-community.github.io/nixvim/
    ### Try again another day?...
    # ../../editors/nixvim
    ../../editors/vim
    ../../editors/vscode

    ../../programs
    ../../programs/gnome.nix

    ../../terminal/programs
    ../../terminal/programs/qemu.nix

    ../../terminal/shell/zsh.nix
  ];

  home = {
    homeDirectory = "/home/archoo";

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
