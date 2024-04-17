{...}: {
  imports = [
    ./autocmd.nix
    ./globals.nix
    ./neovide.nix
    ./options.nix
  ];

  ### for all your got-it-from-the-web hacks
  extraConfigVim = builtins.readFile ./lua/general.vim;
}
