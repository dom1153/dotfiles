{...}: {
  ### trying to style this drives me up the walls! (also not a necessary plugin)
  ### text alignement keeps jumping around
  ### EDIT: default config DO work, however, they require an opaque background
  ###       However, changing separator styles and such still have issues.
  ###       So we're disabling this plugin still
  plugins = {
    ### A snazzy 💅 buffer line (with tabpage integration)
    bufferline = {
      enable = true;

      mode = "tabs";

      # # separatorStyle = "thin";
      # separatorStyle = {__raw = "{'', ''}";};
      # ### remove gray | found next to selected buffer
      # indicator.icon = "";
      # showBufferCloseIcons = false;
      # showCloseIcon = false;
      # highlights.bufferSelected.italic = false;
      # highlights.bufferSelected.bold = false;
      # extraOptions = {
      #   # "style_preset" = ["bufferline.style_preset.no_italic"];
      #   # "style_preset" = {__raw = "bufferline.style_preset.minimal";};
      # };

      offsets = [
        {
          filetype = "neo-tree";
          text = "Neo-tree";
          highlight = "Directory";
          text_align = "left";
        }
      ];
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>b";
      action = "+buffers";
    }

    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }

    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
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

    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<cr>";
      options = {
        desc = "Delete buffer";
      };
    }

    {
      mode = "n";
      key = "<leader>bb";
      action = "<cmd>e #<cr>";
      options = {
        desc = "Switch to Other Buffer";
      };
    }

    # {
    #   mode = "n";
    #   key = "<leader>`";
    #   action = "<cmd>e #<cr>";
    #   options = {
    #     desc = "Switch to Other Buffer";
    #   };
    # }

    {
      mode = "n";
      key = "<leader>br";
      action = "<cmd>BufferLineCloseRight<cr>";
      options = {
        desc = "Delete buffers to the right";
      };
    }

    {
      mode = "n";
      key = "<leader>bl";
      action = "<cmd>BufferLineCloseLeft<cr>";
      options = {
        desc = "Delete buffers to the left";
      };
    }

    {
      mode = "n";
      key = "<leader>bo";
      action = "<cmd>BufferLineCloseOthers<cr>";
      options = {
        desc = "Delete other buffers";
      };
    }

    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>BufferLineTogglePin<cr>";
      options = {
        desc = "Toggle pin";
      };
    }

    {
      mode = "n";
      key = "<leader>bP";
      action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
      options = {
        desc = "Delete non-pinned buffers";
      };
    }
  ];
}
