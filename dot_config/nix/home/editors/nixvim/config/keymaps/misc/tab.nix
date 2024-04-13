{...}: {
  extraConfigLua = builtins.readFile ./lua/tab.lua;

  keymaps = [
  ];
}
