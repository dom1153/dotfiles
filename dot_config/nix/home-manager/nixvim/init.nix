{...}: {
  imports = [
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
}
