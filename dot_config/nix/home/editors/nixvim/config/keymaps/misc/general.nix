{...}: {
  extraConfigLua = builtins.readFile ./lua/general.lua;
}
