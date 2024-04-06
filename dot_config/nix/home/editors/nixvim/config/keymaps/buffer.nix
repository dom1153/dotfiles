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
  ];
}
