{...}: {
  programs.nixvim = {
    ### See `:help mapleader`
    keymaps = [
      {
        mode = "v";
        key = "<";
        action = "<gv";
        options = {
          silent = true;
          desc = "Indent while remaining in visual mode.";
        };
      }

      {
        mode = "v";
        key = ">";
        action = ">gv";
        options = {
          silent = true;
          desc = "Indent while remaining in visual mode.";
        };
      }

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

      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>BufferLineCycleNext<cr>";
        options = {
          desc = "Cycle to next buffer";
        };
      }

      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>BufferLineCyclePrev<cr>";
        options = {
          desc = "Cycle to previous buffer";
        };
      }

      ### sx (reload config) -> my custom setup does not generate normal init.lua file... :((((
      {
        mode = "n";
        key = "<leader>r";
        action = "<cmd>luafile $MYVIMRC<CR>";
      }

      ### I'll probabalby forget this visual select feature lmao
      {
        mode = "v";
        key = "<leader>gv";
        action = "<cmd>Telescope git_bcommits_range<cr>";
        options = {
          desc = "Git Buffer Commit (visual) Range";
        };
      }

      ### VVV screws up yank motions (e.g. surround word)
      {
        mode = ["n" "v"];
        key = "y";
        action = "\"+y";
        options = {
          desc = "Copy to system clipboard (motion)";
        };
      }

      {
        mode = ["n" "v"];
        key = "Y";
        action = "\"+Y";
        options = {
          desc = "Copy to system clipboard (motion)";
        };
      }
    ];
  };
}
