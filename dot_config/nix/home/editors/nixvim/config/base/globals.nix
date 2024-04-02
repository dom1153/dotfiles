{...}: {
  globals = {
    ### See `:help mapleader`
    mapleader = " ";
    maplocalleader = " ";

    have_nerd_font = true;
  };

  extraConfigLua = builtins.readFile ./lua/neovide.lua;
}
