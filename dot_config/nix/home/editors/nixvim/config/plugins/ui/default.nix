{...}: {
  imports = [
    ./misc/dressing-nvim.nix
    ./misc/fidget.nix
    # ./misc/indent-blankline.nix ### something is configured wrong
    ./misc/noice.nix
    ./misc/nui.nix
    ./misc/nvim-notify.nix
    ./misc/which-key.nix

    ./startpage/alpha.nix

    ./statusline/lualine.nix
    ./statusline/staline.nix
  ];
}
