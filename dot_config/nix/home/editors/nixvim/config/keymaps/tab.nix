{...}: {
  keymaps = [
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
  ];
}
