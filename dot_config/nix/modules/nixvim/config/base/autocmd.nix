{...}: {
  autoCmd = [
    {
      event = ["TextYankPost"];
      desc = "Highlight when yanking (copying) text";
      callback = {__raw = "function() vim.highlight.on_yank() end";};
    }
  ];

  extraConfigLua = builtins.readFile ./lua/autocmd.lua;

  ### :help -> :tab help
  # extraConfigVim = "cabbrev help tab help";
}
