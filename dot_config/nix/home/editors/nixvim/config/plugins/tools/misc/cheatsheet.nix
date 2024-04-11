{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    cheatsheet-nvim
  ];

  extraConfigLua = builtins.readFile ./lua/cheatsheet.lua;
  extraFiles = {
    "cheatsheet.txt" = builtins.readFile ./cheatsheet/cheatsheet.txt;
  };

  keymaps = [
    ### rebinding default to have a proper desc
    {
      mode = "n";
      key = "<Leader>?";
      action = "<cmd>Cheatsheet<cr>";
      options = {
        desc = "Command Palette (cheatsheet)";
      };
    }
  ];
}
