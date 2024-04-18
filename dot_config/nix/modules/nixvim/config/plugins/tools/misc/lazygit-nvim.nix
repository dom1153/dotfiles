{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    lazygit-nvim
  ];

  extraPackages = with pkgs; [
    lazygit
  ];

  extraConfigLua = builtins.readFile ./lua/lazygit-nvim.lua;
}
