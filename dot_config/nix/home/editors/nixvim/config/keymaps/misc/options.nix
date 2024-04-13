{...}: {
  extraConfigLua = builtins.readFile ./lua/options.lua;

  keymaps = [
  ];
}
