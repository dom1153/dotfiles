{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./options.nix
    ./globals.nix
    ./keymaps

    ./colorschemes/catppuccin.nix

    ./autocmd.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
  };

  ### VVV TODO this should be a module enable feature with possibility to override
  home.sessionVariables.EDITOR = "nvim";
}
