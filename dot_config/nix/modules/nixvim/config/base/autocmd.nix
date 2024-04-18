{...}: {
  autoCmd = [
    {
      event = ["TextYankPost"];
      desc = "Highlight when yanking (copying) text";
      callback = {__raw = "function() vim.highlight.on_yank() end";};
    }
  ];
}
