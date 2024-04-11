{...}: {
  imports = [
    # ./misc/dressing-nvim.nix
    # ./misc/indent-blankline.nix ### 'something is configured wrong'
    # ./misc/noice.nix
    # ./misc/nui.nix
    ./misc/wilder.nix

    # ./notify/nvim-notify.nix
    # ./notif0y/fidget.nix

    # ./startpage/alpha.nix

    # ./statusline/lualine.nix
    ./statusline/staline.nix

    ./widgets/which-key.nix
  ];
}
