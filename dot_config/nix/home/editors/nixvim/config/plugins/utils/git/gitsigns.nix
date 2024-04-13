{
  extraConfigLua = builtins.readFile ./lua/gitsigns.lua;

  ### Super fast git decorations implemented purely in Lua.
  plugins.gitsigns = {
    enable = true;
    settings = {
      trouble = false;
    };
  };
}
