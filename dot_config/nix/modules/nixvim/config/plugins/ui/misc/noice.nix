{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    noice-nvim
    nui-nvim ### dep
  ];

  extraConfigLua = builtins.readFile ./lua/noice.lua;

  ### exists in nixvim, but couldn't figure out virtual text override. so using base plugin
}
