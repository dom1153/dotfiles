{...}: {
  imports = [
    ./telescope/telescope.nix

    ./misc/cheatsheet.nix
    ./misc/mini.nix
    # ./misc/oil.nix
    ./misc/toggleterm.nix
    ./misc/buffer_manager.nix
    ./misc/lazygit-nvim.nix
    # ./misc/compiler.nix ### also an extension of overseer
    # ./misc/makeit.nix ### primitive; doesn't parse makefile is incomplete ; is just an extension of overseer
  ];
}
