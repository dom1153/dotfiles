{...}: {
  ### plugins with keymaps:
  ### which-key
  ### telescope

  imports = [
    ./tab.nix
    ./window.nix
    ./buffer.nix
    # ./persistence.nix
    # ./option.nix
  ];

  extraConfigLua = builtins.readFile ./lua/keymaps.lua;

  ### See `:help mapleader`
  keymaps = [
    ### esc -> nohzaak
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
    }

    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options = {
        silent = true;
        desc = "Move up when line is highlighted";
      };
    }

    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options = {
        silent = true;
        desc = "Move down when line is highlighted";
      };
    }

    {
      mode = "n";
      key = "J";
      action = "mzJ`z";
      options = {
        silent = true;
        desc = "Allow cursor to stay in the same place after appeding to current line";
      };
    }

    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
      options = {
        silent = true;
        desc = "Allow <C-d> and <C-u> to keep the cursor in the middle";
      };
    }

    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
      options = {
        desc = "Allow C-d and C-u to keep the cursor in the middle";
      };
    }

    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options = {
        desc = "Allow search terms to stay in the middle";
      };
    }

    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options = {
        desc = "Allow search terms to stay in the middle";
      };
    }

    {
      mode = ["n" "v"];
      key = "<leader>y";
      action = "\"+y";
      options = {
        desc = "Copy to system clipboard (motion)";
      };
    }

    {
      mode = ["n" "v"];
      key = "<leader>d";
      action = "\"_d";
      options = {
        desc = "Delete to void register (motion)";
      };
    }

    # <C-c> instead of pressing esc (insert mode) just because
    {
      mode = "i";
      key = "<C-c>";
      action = "<Esc>";
    }
  ];
}
