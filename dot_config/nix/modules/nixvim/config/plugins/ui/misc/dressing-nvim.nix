{pkgs, ...}: {
  ### more pretty ui things
  ### also separated into modules
  extraPlugins = with pkgs.vimPlugins; [
    dressing-nvim
  ];
  extraConfigLua = builtins.readFile ./lua/dressing.lua;
}
