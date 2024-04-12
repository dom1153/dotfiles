{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    neodev-nvim
  ];

  extraConfigLua = builtins.readFile ./lua/neodev.lua;
}
