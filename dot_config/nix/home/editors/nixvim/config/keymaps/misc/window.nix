{...}: {
  extraConfigLua = builtins.readFile ./lua/window.lua;

  keymaps = [
  ];
}
