{...}: {
  imports = [
    # ./which-key.nix
    ./persistence.nix
    ./tab.nix
    ./window.nix
    ./option.nix
  ];

  programs.nixvim = {
    ### See `:help mapleader`
    keymaps = [
      ### esc -> noh
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
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

      # Remap for dealing with word wrap and adding jumps to the jumplist.
      # {
      #   mode = "n";
      #   key = "j";
      #   action.__raw = "
      #   [[(v:count > 1 ? 'm`' . v:count : 'g') . 'j']]
      # ";
      #   options = {
      #     expr = true;
      #     desc = "Remap for dealing with word wrap and adding jumps to the jumplist.";
      #   };
      # }

      # {
      #   mode = "n";
      #   key = "k";
      #   action.__raw = "
      #   [[(v:count > 1 ? 'm`' . v:count : 'g') . 'k']]
      # ";
      #   options = {
      #     expr = true;
      #     desc = "Remap for dealing with word wrap and adding jumps to the jumplist.";
      #   };
      # }

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

      # Copy stuff to system clipboard with <leader> + y or just y to have it just in vim
      {
        mode = ["n" "v"];
        key = "<leader>y";
        action = "\"+y";
        options = {
          desc = "Copy to system clipboard";
        };
      }

      {
        mode = ["n" "v"];
        key = "<leader>Y";
        action = "\"+Y";
        options = {
          desc = "Copy to system clipboard";
        };
      }

      # Delete to void register
      {
        mode = ["n" "v"];
        key = "<leader>D";
        action = "\"_d";
        options = {
          desc = "Delete to void register";
        };
      }

      # <C-c> instead of pressing esc (insert mode) just because
      {
        mode = "i";
        key = "<C-c>";
        action = "<Esc>";
      }
    ];

    extraConfigLua = ''
    '';
  };
}
