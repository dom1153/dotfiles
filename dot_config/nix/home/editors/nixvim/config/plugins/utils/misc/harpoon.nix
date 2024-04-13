{
  ### Getting you where you want with the fewest keystrokes.
  plugins.harpoon = {
    enable = true;
    enableTelescope = true;
    keymapsSilent = true;
  };

  extraConfigLua = builtins.readFile ./lua/harpoon.lua;
}
