{...}: {
  imports = [
    ./base/autocmd.nix

    ./base/globals.nix
    ./base/options.nix

    ./keymaps

    ./colorschemes/catppuccin.nix

    ./plugins
  ];
}
