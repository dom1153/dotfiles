{inputs, ...}: {
  imports = [
    ./options.nix
    ./globals.nix
    ./keymaps/keymaps.nix

    ./colorschemes/catppuccin.nix

    ./autocmd.nix
    ./plugins/plugins.nix

    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
  };
}
