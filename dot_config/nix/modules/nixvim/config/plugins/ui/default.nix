{...}: {
  imports = [
    # ./misc/dressing-nvim.nix
    # ./misc/indent-blankline.nix ### 'something is configured wrong'
    ./misc/noice.nix
    ./misc/wilder.nix
    ./misc/nvim-scrollview.nix
    # ./misc/nvim-scrollbar.nix ### a bit too thin and hard to see
    # ./misc/nvim-scrollbar.nix ### a bit too thin and hard to see
    # ./misc/satellite.nix ### requires nightly
    # ./misc/neoscroll.nix
    # ./misc/dropbar.nix ### requires vim 0.10+

    # ./notify/nvim-notify.nix
    # ./notif0y/fidget.nix

    # ./startpage/alpha.nix

    ./statusline/lualine.nix
    # ./statusline/staline.nix
    # ./statusline/heirline.nix

    ./widgets/which-key.nix
  ];
}
