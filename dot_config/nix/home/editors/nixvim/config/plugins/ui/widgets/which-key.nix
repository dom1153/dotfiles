{...}: {
  extraConfigLua = builtins.readFile ./lua/which-key.lua;

  ### displays a popup with possible key bindings of the command you started typing
  plugins.which-key = {
    enable = true;
  };

  keymaps = [
  ];
}
