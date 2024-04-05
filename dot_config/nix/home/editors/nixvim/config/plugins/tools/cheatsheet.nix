{pkgs, ...}: {
  ### staline(STAtusLINE): A simple statusline for neovim written in lua.
  ### stabline(s-TABLINE): A simple bufferline for neovim written in lua. (sry didnt get a better name.)
  extraPlugins = with pkgs.vimPlugins; [
    cheatsheet-nvim
  ];

  extraConfigLua = builtins.readFile ./lua/cheatsheet.lua;

  keymaps = [
    {
      mode = "n";
      key = "<Leader>p";
      action = "<cmd>Cheatsheet<cr>";
      options = {
        desc = "Command Palette (cheatsheet)";
      };
    }
  ];
}
