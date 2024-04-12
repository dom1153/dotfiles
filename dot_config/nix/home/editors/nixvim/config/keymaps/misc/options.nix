{...}: {
  extraConfigLua = builtins.readFile ./lua/options.lua;

  ### See `:help mapleader`
  keymaps = [
    # {
    #   mode = "n";
    #   key = "<Esc>";
    #   action = "<cmd>nohlsearch<CR>";
    # }
  ];
}
