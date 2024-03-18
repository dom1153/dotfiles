{pkgs, ...}: {
  imports = [
    ../../../home

    ../../editors/nixvim
    ../../editors/vim
    ../../editors/vscode

    ../../programs
    ../../programs/hyprland

    ../../terminal/programs

    ../../terminal/shell/zsh.nix
  ];

  home = {
    sessionVariables = {
      ### https://github.com/USA-RedDragon/jagex-launcher-flatpak
      ### add flatpak bin paths (runescape)
      XDG_DATA_DIRS = "$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
    };

    packages = with pkgs; [
      ### vscode
      alejandra
      nil

      ### cli tools and services
      # trash-cli
      trashy
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };
}
