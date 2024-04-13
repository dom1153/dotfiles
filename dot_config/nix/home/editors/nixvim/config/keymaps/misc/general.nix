{...}: {
  extraConfigLua = builtins.readFile ./lua/general.lua;

  ### See `:help mapleader`
  keymaps = [
  ];
}
