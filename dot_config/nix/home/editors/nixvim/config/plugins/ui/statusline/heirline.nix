{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    heirline-nvim
  ];

  extraConfigLua = builtins.readFile ./lua/heirline.lua;
}
