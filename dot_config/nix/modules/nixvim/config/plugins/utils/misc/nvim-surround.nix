{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    nvim-surround
  ];

  extraConfigLua = builtins.readFile ./lua/nvim-surround.lua;
}
