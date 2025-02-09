{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    ../../../home

    ../../terminal/programs/vim.nix

    # ../../terminal/programs
    ../../terminal/programs/direnv.nix
    ../../terminal/programs/gh.nix
    ../../terminal/programs/git.nix

    ./cli.nix

    ../../terminal/shell/zsh.nix
    ../../terminal/shell/fish.nix
  ];

  home = {
    homeDirectory = "/home/archoo";

    sessionVariables = {
      # EDITOR = "nvim";

      # XAUTHORITY = "${config.home.homeDirectory}/.Xauthority";
    };

    packages = with pkgs; [
      trash-cli

      ### local dev
      gnumake

      nvim-pkg # kickstar nvim package

      python312Packages.pywatchman ### watchman-make

      gparted
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };
}
