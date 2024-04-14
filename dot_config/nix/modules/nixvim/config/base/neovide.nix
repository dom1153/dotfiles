{...}: {
  extraConfigLua = builtins.readFile ./lua/neovide.lua;
}
