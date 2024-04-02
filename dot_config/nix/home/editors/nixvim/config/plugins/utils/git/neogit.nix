{
  ### A git interface for Neovim, inspired by Magit.
  plugins.neogit = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>Neogit<CR>";
    }
  ];
}
