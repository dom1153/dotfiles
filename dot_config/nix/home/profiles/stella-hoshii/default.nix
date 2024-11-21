{pkgs, inputs, ...}: let
in {
  imports = [
    ../../../home

    ../../terminal/programs/vim.nix

    ../../terminal/programs

    ../../terminal/shell/zsh.nix
    ../../terminal/shell/fish.nix
  ];

  xdg.enable = true; ### try and get lazygit to use xdg instead of app support

  home = {
    homeDirectory = "/Users/archoo"; ### optional since defined in os folder

    sessionVariables = {
      EDITOR = "nvim";
    };

    packages = with pkgs; [
      # ### vscode extension deps
      alejandra
      nil

      darwin.trash

      nvim-pkg # kickstart nvim package

      gnused ### macos is posix, but not gnu

      android-tools ### also on brew (android-platform-tools)
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };
}
