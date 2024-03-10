{...}: {
  imports = [
    ./options.nix
    ./globals.nix
    ./keymaps.nix

    ./colorschemes/catppuccin.nix

    ./autocmd.nix
    ./plugins.nix
  ];

  programs.nixvim = {
    enable = true;
  };
}
