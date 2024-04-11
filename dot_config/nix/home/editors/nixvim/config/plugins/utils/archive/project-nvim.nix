{
  ### project.nvim is an all in one neovim plugin written in lua that provides superior project management.
  ### concept is cool, but I don't want auto-cd when I nvim into directory
  plugins.project-nvim = {
    enable = true;
    enableTelescope = true;
    # detectionMethods = ["lsp" "pattern"];
    # patterns = ".git" "_darcs" ".hg" ".bzr" ".svn" "Makefile" "package.json"]
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>fp";
      action = "<cmd>Telescope projects<CR>";
      options = {
        desc = "Projects";
      };
    }
  ];
}
