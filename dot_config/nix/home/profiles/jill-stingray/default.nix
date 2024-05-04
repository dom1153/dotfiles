{
  inputs,
  pkgs,
  ...
}: let
  unstable = import inputs.nixpkgs-unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
in {
  imports = [
    ../../../home

    ../../programs
    ../../programs/hyprland
    ../../programs/mime.nix
    ../../programs/vscode.nix
    # ../../programs/gnome.nix

    ../../terminal/programs
    ../../terminal/programs/qemu.nix

    ../../terminal/shell/zsh.nix
    ../../terminal/shell/fish.nix
    ../../terminal/shell/nushell.nix

    ../../terminal/programs/vim.nix
  ];

  home = {
    homeDirectory = "/home/archoo";

    sessionVariables = {
      ### https://github.com/USA-RedDragon/jagex-launcher-flatpak
      ### add flatpak bin paths (runescape)
      XDG_DATA_DIRS = "$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";

      EDITOR = "nvim";
    };

    packages = with pkgs; [
      ### gui services
      bazecor ### seems to be bugged
      font-manager
      qbittorrent

      ### gui art
      drawpile
      blender
      pureref ### only works on this system :)
      # krita

      ### gui apps
      unstable.signal-desktop ### limited ot 5 devices
      ### can't revert this due to sql db having issues

      ### cli tools and services
      thefuck
      trash-cli

      ### tui
      nitch
      ranger
      ttyper

      nix-prefetch-github ### for the dumb nixos stuff
      gnumake

      nvim-pkg # kickstar nvim package
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };
}
