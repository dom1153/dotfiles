{...}: {
  programs.nixvim = {
    ### See `:help mapleader`
    keymaps = [
      {
        mode = "n";
        key = "<leader>qa";
        action = "<cmd>quitall<cr><esc>";
        options = {
          silent = true;
          desc = "Quit all";
        };
      }

      {
        mode = "n";
        key = "<leader>ul";
        action = ":lua ToggleLineNumber()<cr>";
        options = {
          silent = true;
          desc = "Toggle Line Numbers";
        };
      }

      {
        mode = "n";
        key = "<leader>uL";
        action = ":lua ToggleRelativeLineNumber()<cr>";
        options = {
          silent = true;
          desc = "Toggle Relative Line Numbers";
        };
      }

      {
        mode = "n";
        key = "<leader>uw";
        action = ":lua ToggleWrap()<cr>";
        options = {
          silent = true;
          desc = "Toggle Line Wrap";
        };
      }

      {
        mode = "n";
        key = "j";
        action.__raw = "
        [[(v:count > 1 ? 'm`' . v:count : 'g') . 'j']]
      ";
        options = {
          expr = true;
          desc = "Remap for dealing with word wrap and adding jumps to the jumplist.";
        };
      }

      {
        mode = "n";
        key = "k";
        action.__raw = "
        [[(v:count > 1 ? 'm`' . v:count : 'g') . 'k']]
      ";
        options = {
          expr = true;
          desc = "Remap for dealing with word wrap and adding jumps to the jumplist.";
        };
      }

      {
        mode = ["n" "v"];
        key = "<leader>Y";
        action = "\"+Y";
        options = {
          desc = "Copy to system clipboard (yy)";
        };
      }
    ];
  };
}
