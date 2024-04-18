{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    tint-nvim
  ];

  extraConfigLua = builtins.readFile ./lua/tint-nvim.lua;
}
