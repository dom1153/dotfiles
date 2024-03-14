{...}: {
  imports = [
    ./options.nix
    ./globals.nix
    ./keymaps/keymaps.nix

    ./colorschemes/catppuccin.nix

    ./autocmd.nix
    ./plugins.nix
  ];

  programs.nixvim = {
    enable = true;
  };
}
