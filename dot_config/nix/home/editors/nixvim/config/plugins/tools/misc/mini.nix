{
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
        options = {
          permanent_delete = false; # use trash
        };
        windows = {
          preview = true; ### Whether to show preview of file/directory under cursor
          width_focus = 40; ### Width of focused window (50)
          width_nofocus = 40; ### Width of non-focused window (15)
          width_preview = 40; ### Width of preview window (25)
        };
      };
      cursorword = {};
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
