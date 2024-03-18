{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./options.nix
    ./globals.nix
    ./keymaps/keymaps.nix

    ./colorschemes/catppuccin.nix

    ./autocmd.nix
    ./plugins/plugins.nix
  ];

  programs.nixvim = {
    enable = true;
  };

  home.sessionVariables.EDITOR = "nvim";
}
