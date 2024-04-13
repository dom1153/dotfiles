{...}: {
  extraConfigLua = builtins.readFile ./lua/keymaps.lua;

  ### See `:help mapleader`
  keymaps = [
  ];
}
