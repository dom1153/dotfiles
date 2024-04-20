{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    neomake
  ];

  ### test
  extraConfigVim = builtins.readFile ./lua/neomake.vim;
  extraConfigLua = builtins.readFile ./lua/neomake.lua;
}
