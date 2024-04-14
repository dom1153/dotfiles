{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    PLUGIN_NAME
  ];

  extraConfigLua = builtins.readFile ./lua/PLUGIN_NAME.lua;
}
