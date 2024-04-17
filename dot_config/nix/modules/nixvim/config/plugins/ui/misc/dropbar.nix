{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    dropbar-nvim
  ];

  extraConfigLua = builtins.readFile ./lua/dropbar.lua;
}
