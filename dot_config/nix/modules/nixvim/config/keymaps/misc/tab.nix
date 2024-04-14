{...}: {
  extraConfigLua = builtins.readFile ./lua/tab.lua;
}
