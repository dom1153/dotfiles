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

      ### translated keympas

      ### esc -> noh
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
      }

      ### visual mode drag
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

      ### visual visual accessibility
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

      ### clipboard and register management (paste seems to inherit clipboard by default)
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

      ### <C-c> instead of pressing esc (insert mode) just because
      {
        mode = "i";
        key = "<C-c>";
        action = "<Esc>";
      }

      ### <C-s> save
      {
        mode = ["i" "n" "x" "s"];
        key = "<C-s>";
        action = "<cmd>w<cr><esc>";
        options = {
          desc = "Save file";
        };
      }

      {
        mode = "n";
        key = "<leader>bd";
        action = "<cmd>bdelete<cr>";
        options = {
          desc = "Delete buffer";
        };
      }

      ### all
      {
        mode = "n";
        key = "<leader>bX";
        action = "<cmd>%bdelete<cr>";
        options = {
          desc = "Delete all buffer";
        };
      }

      ### previous buffer
      {
        mode = "n";
        key = "<leader>bo";
        action = "<cmd>e #<cr>";
        options = {
          desc = "Switch Other Buffer";
        };
      }

      # Tab magement via <leader>t
      {
        mode = "n";
        key = "<leader>tn";
        action = "<cmd>tabnew<cr>";
        options = {
          silent = true;
          desc = "New Tab";
        };
      }

      {
        mode = "n";
        key = "<leader>tt";
        action = "<cmd>tabnext<cr>";
        options = {
          silent = true;
          desc = "Next Tab";
        };
      }

      {
        mode = "n";
        key = "<leader>tx";
        action = "<cmd>tabclose<cr>";
        options = {
          silent = true;
          desc = "Close tab";
        };
      }

      {
        mode = "n";
        key = "<leader>tp";
        action = "<cmd>tabprevious<cr>";
        options = {
          silent = true;
          desc = "Previous Tab";
        };
      }

      # Manage Windows with <leader>w

      ### Navigation (standard)
      {
        mode = "n";
        key = "<leader>wh";
        action = "<C-W>h";
        options = {
          silent = true;
          desc = "Go to window left";
        };
      }

      {
        mode = "n";
        key = "<leader>wj";
        action = "<C-W>j";
        options = {
          silent = true;
          desc = "Go to window down";
        };
      }

      {
        mode = "n";
        key = "<leader>wk";
        action = "<C-W>k";
        options = {
          silent = true;
          desc = "Go to window up";
        };
      }

      {
        mode = "n";
        key = "<leader>wl";
        action = "<C-W>l";
        options = {
          silent = true;
          desc = "Go to window right";
        };
      }

      ### Navigation (arrows)
      {
        mode = "n";
        key = "<Left>";
        action = "<C-W>h";
        options = {
          silent = true;
          desc = "Go to window left";
        };
      }

      {
        mode = "n";
        key = "<Down>";
        action = "<C-W>j";
        options = {
          silent = true;
          desc = "Go to window down";
        };
      }

      {
        mode = "n";
        key = "<Up>";
        action = "<C-W>k";
        options = {
          silent = true;
          desc = "Go to window up";
        };
      }

      {
        mode = "n";
        key = "<Right>";
        action = "<C-W>l";
        options = {
          silent = true;
          desc = "Go to window right";
        };
      }

      ### Navigation (A-hjkl)
      {
        mode = "n";
        key = "<A-h>";
        action = "<C-W>h";
        options = {
          silent = true;
          desc = "Go to window left";
        };
      }

      {
        mode = "n";
        key = "<A-j>";
        action = "<C-W>j";
        options = {
          silent = true;
          desc = "Go to window down";
        };
      }

      {
        mode = "n";
        key = "<A-k>";
        action = "<C-W>k";
        options = {
          silent = true;
          desc = "Go to window up";
        };
      }

      {
        mode = "n";
        key = "<A-l>";
        action = "<C-W>l";
        options = {
          silent = true;
          desc = "Go to window right";
        };
      }

      ### create / close windows
      {
        mode = "n";
        key = "<leader>ws";
        action = "<C-W>s";
        options = {
          silent = true;
          desc = "Split window below";
        };
      }

      {
        mode = "n";
        key = "<leader>wv";
        action = "<C-W>v";
        options = {
          silent = true;
          desc = "Split window right";
        };
      }

      {
        mode = "n";
        key = "<leader>wx";
        action = "<C-W>c";
        options = {
          silent = true;
          desc = "Close window";
        };
      }

      ### Other navigation
      {
        mode = "n";
        key = "<leader>ww";
        action = "<C-W>w";
        options = {
          silent = true;
          desc = "Next windows";
        };
      }

      {
        mode = "n";
        key = "<leader>wx";
        action = "<C-W>x";
        options = {
          silent = true;
          desc = "Swap current with next";
        };
      }

      {
        mode = "n";
        key = "<leader>wp";
        action = "<C-W>p";
        options = {
          silent = true;
          desc = "Other window";
        };
      }

      ### resize
      {
        mode = "n";
        key = "<leader>w_";
        action = "<C-W>_";
        options = {
          silent = true;
          desc = "Max out the height";
        };
      }

      {
        mode = "n";
        key = "<leader>w|";
        action = "<C-W>|";
        options = {
          silent = true;
          desc = "Max out the width";
        };
      }

      {
        mode = "n";
        key = "<leader>w=";
        action = "<C-W>=";
        options = {
          silent = true;
          desc = "Equally high and wide";
        };
      }

      ### tab.nix
      {
        mode = "n";
        key = "<leader>t";
        action = "+tab / term";
      }

      ### window.nix
      {
        mode = "n";
        key = "<leader>w";
        action = "+window";
      }

      ### buffers.nix
      {
        mode = "n";
        key = "<leader>b";
        action = "+buffers";
      }

      {
        mode = "n";
        key = "<leader>f";
        action = "+find";
      }

      {
        mode = "n";
        key = "<leader>g";
        action = "+git";
      }

      {
        mode = "n";
        key = "<leader>v";
        action = "+vim";
      }

      {
        mode = "n";
        key = "<leader>u";
        action = "+ui/ux";
      }

      {
        mode = "n";
        key = "<leader>n";
        action = "+notifications";
      }

      {
        mode = "n";
        key = "<leader>fu";
        action = "<cmd>Telescope undo<CR>";
        options = {
          desc = "Undo tree";
        };
      }

      ### list buffers on fb or bb
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>";
        options = {
          desc = "Buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>bb";
        action = "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>";
        options = {
          desc = "Buffer";
        };
      }

      ### for frecency plugin
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope frecency workspace=CWD<cr>";
        options = {
          desc = "Files (frecency ; hidden files)";
        };
      }

      ### vertical split
      {
        mode = "n";
        key = "<leader>tV";
        action = "<cmd>ToggleTerm direction=vertical name=Terminal-Vertical<CR>";
        options = {
          desc = "Terminal Vertical Split (root)";
        };
      }

      {
        mode = "n";
        key = "<leader>tv";
        action = "<cmd>ToggleTerm dir=%:p:h direction=vertical name=Terminal-Vertical-cwd<CR>";
        options = {
          desc = "Terminal Vertical Split (cwd)";
        };
      }

      ### horizontal split
      {
        mode = "n";
        key = "<leader>th";
        action = "<cmd>ToggleTerm dir=%:p:h direction=horizontal name=Terminal-Horizontal-cwd<CR>";
        options = {
          desc = "Terminal Horizontal Split (cwd)";
        };
      }

      {
        mode = "n";
        key = "<leader>tH";
        action = "<cmd>ToggleTerm direction=horizontal name=Terminal-Horizontal<CR>";
        options = {
          desc = "Terminal Horizontal Split (root)";
        };
      }
      ### float
      {
        mode = "n";
        key = "<leader>tf";
        action = "<cmd>ToggleTerm dir=%:p:h direction=float name=Terminal-Float<CR>";
        options = {
          desc = "Terminal Float";
        };
      }

      {
        mode = "n";
        key = "<leader>tF";
        action = "<cmd>ToggleTerm direction=float name=Terminal-Float<CR>";
        options = {
          desc = "Terminal Float";
        };
      }

      ### term

      {
        mode = "n";
        key = "<leader>tt";
        action = "<cmd>ToggleTerm dir=%:p:h direction=tab name=Terminal-Tab<CR>";
        options = {
          desc = "Terminal Tab";
        };
      }

      {
        mode = "n";
        key = "<leader>tT";
        action = "<cmd>ToggleTerm direction=tab name=Terminal-Tab<CR>";
        options = {
          desc = "Terminal Tab";
        };
      }

      ### gitsigns
      {
        mode = ["n" "v"];
        key = "<leader>gh";
        action = "gitsigns";
        options = {
          silent = true;
          desc = "+hunks";
        };
      }
      {
        mode = "n";
        key = "<leader>ghb";
        action = ":Gitsigns blame_line<CR>";
        options = {
          silent = true;
          desc = "Blame line";
        };
      }
      {
        mode = "n";
        key = "<leader>ghd";
        action = ":Gitsigns diffthis<CR>";
        options = {
          silent = true;
          desc = "Diff This";
        };
      }
      {
        mode = "n";
        key = "<leader>ghp";
        action = ":Gitsigns preview_hunk<CR>";
        options = {
          silent = true;
          desc = "Preview hunk";
        };
      }
      {
        mode = "n";
        key = "<leader>ghR";
        action = ":Gitsigns reset_buffer<CR>";
        options = {
          silent = true;
          desc = "Reset Buffer";
        };
      }
      {
        mode = ["n" "v"];
        key = "<leader>ghr";
        action = ":Gitsigns reset_hunk<CR>";
        options = {
          silent = true;
          desc = "Reset Hunk";
        };
      }
      {
        mode = ["n" "v"];
        key = "<leader>ghs";
        action = ":Gitsigns stage_hunk<CR>";
        options = {
          silent = true;
          desc = "Stage Hunk";
        };
      }
      {
        mode = "n";
        key = "<leader>ghS";
        action = ":Gitsigns stage_buffer<CR>";
        options = {
          silent = true;
          desc = "Stage Buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>ghu";
        action = ":Gitsigns undo_stage_hunk<CR>";
        options = {
          silent = true;
          desc = "Undo Stage Hunk";
        };
      }

      {
        mode = "n";
        key = "<Leader>p";
        action = "<cmd>Cheatsheet<cr>";
        options = {
          desc = "Command Palette";
        };
      }
    ];
  };
}
