{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    dressing-nvim
  ];
  extraConfigLua = builtins.readFile ./lua/dressing.lua;
}
