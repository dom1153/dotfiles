{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    neomake
  ];

  extraConfigVim = builtins.readFile ./lua/neomake.vim;
  extraConfigLua = builtins.readFile ./lua/neomake.lua;
}
