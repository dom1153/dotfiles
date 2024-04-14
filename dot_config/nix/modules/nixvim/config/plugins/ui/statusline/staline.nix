{pkgs, ...}: {
  ### staline(STAtusLINE): A simple statusline for neovim written in lua.
  ### stabline(s-TABLINE): A simple bufferline for neovim written in lua. (sry didnt get a better name.)
  extraPlugins = with pkgs.vimPlugins; [
    staline-nvim
  ];

  ### TODO: I love this plugin, but tabline disappears
  ### need a statusline (luavim, staline) to compensate
  extraConfigLua = builtins.readFile ./lua/staline.lua;

  keymaps = [
    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>bnext<cr>";
      options = {
        desc = "Next buffer";
      };
    }

    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>bprev<cr>";
      options = {
        desc = "Previous buffer";
      };
    }
  ];
}
