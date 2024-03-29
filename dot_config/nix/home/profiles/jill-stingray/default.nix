{pkgs, ...}: {
  imports = [
    ../../../home

    ../../editors/nixvim
    ../../editors/vim
    ../../editors/vscode

    ../../programs
    ../../programs/hyprland
    # ../../programs/mime.nix

    ../../terminal/programs
    ../../terminal/programs/qemu.nix

    ../../terminal/shell/zsh.nix
  ];

  home = {
    homeDirectory = "/home/archoo";

    sessionVariables = {
      ### https://github.com/USA-RedDragon/jagex-launcher-flatpak
      ### add flatpak bin paths (runescape)
      XDG_DATA_DIRS = "$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
    };

    packages = with pkgs; [
      ### gui services
      bazecor ### seems to be bugged
      font-manager
      qbittorrent

      ### gui art
      drawpile
      blender
      pureref
      # krita

      ### gui apps
      signal-desktop ### limited ot 5 devices

      ### cli tools and services
      thefuck
      trash-cli

      ### tui
      nitch
      ranger
      ttyper
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };
}
