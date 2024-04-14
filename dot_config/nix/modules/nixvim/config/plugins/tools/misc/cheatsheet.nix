{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    cheatsheet-nvim
  ];

  extraConfigLua = builtins.readFile ./lua/cheatsheet.lua;
  extraFiles = {
    "cheatsheet.txt" = builtins.readFile ./cheatsheet/cheatsheet.txt;
  };

  keymaps = [
  ];
}
