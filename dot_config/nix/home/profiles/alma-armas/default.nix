{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../../home

    ../../terminal/programs/vim.nix

    ../../terminal/programs

    ../../terminal/shell/zsh.nix
    ../../terminal/shell/fish.nix
  ];

  home = {
    homeDirectory = "/home/archoo";

    sessionVariables = {
      EDITOR = "nvim";
    };

    packages = with pkgs; [
      trash-cli

      ### local dev
      nix-prefetch-github ### for the dumb nixos stuff
      gnumake

      nvim-pkg # kickstar nvim package

      python312Packages.pywatchman ### watchman-make
      jnv ### interactive jq
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };
}
