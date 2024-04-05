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

  keymaps = [
    {
      mode = ["n"];
      key = "<leader>e";
      action = "<cmd>lua MiniFiles.open()<cr>";
      options = {
        desc = "Open mini";
      };
    }
  ];
}
