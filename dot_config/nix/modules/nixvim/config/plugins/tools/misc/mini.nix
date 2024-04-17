{
  extraConfigLua = builtins.readFile ./lua/mini.lua;

  plugins.mini = {
    enable = true;
    modules = {
      ### this may do treesitter related commenting?
      # comment = {
      #   options = {
      #     customCommentString = ''
      #       <cmd>lua require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring<cr>
      #     '';
      #   };
      # };
      files = {
        mappings = {
          close = "<Esc>"; ### default q
          go_in = "l";
          go_in_plus = "L";
          go_out = "h";
          go_out_plus = "H";
          reset = "<BS>";
          reveal_cwd = "@";
          show_help = "<leader>?";
          synchronize = "=";
          trim_left = "<";
          trim_right = ">";
        };
        options = {
          ### Target directory is 'mini.files/trash' inside standard path of Neovim data directory
          ### :echo stdpath('data') to see its path
          ### Liklely ~/.local/share/nvim/mini.files/trash
          permanent_delete = false;
          use_as_default_explorer = true;
        };
        windows = {
          preview = true; ### Whether to show preview of file/directory under cursor
          width_focus = 40; ### Width of focused window (50)
          width_nofocus = 40; ### Width of non-focused window (15)
          width_preview = 40; ### Width of preview window (25)
        };
      };
      cursorword = {}; ### highlight similar text when cursor over it (illuminate)
      bufremove = {}; ### selects mru buffer when deleting a buffer
      # animate = {
      #   cursor = {
      #     enable = false;
      #   };
      # };
    };
  };

  ### see ':highlight' for previews (idk how to search...)
  ### bg based off ':hi IlluminatedWordText'
  highlightOverride = {
    MiniCursorword = {
      bg = "#393b4e";
      # reverse = true;
    };
    MiniCursorwordCurrent = {
      bg = "#393b4e";
      # reverse = true;
    };
  };

  keymaps = [
    {
      mode = ["n"];
      key = "<leader>e";
      ### https://github.com/echasnovski/mini.nvim/discussions/395
      ### open explorer pointing to file instead of PWD
      action.__raw = ''
        function()
          local minifiles = require('mini.files')
          minifiles.open(vim.api.nvim_buf_get_name(0))
          minifiles.reveal_cwd()
        end
      '';
      options = {
        desc = "Open mini";
      };
    }
  ];
}
