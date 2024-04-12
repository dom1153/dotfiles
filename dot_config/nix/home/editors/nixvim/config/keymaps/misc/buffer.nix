{...}: {
  keymaps = [
    ### TODO: find a way to delete all buffers, or all other buffers
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

    ### previous buffer (TODO: alt bind this)
    {
      mode = "n";
      key = "<leader>bo";
      action = "<cmd>e #<cr>";
      options = {
        desc = "Switch Other Buffer";
      };
    }
  ];
}
