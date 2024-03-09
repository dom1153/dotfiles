{...}: {
  programs.nixvim = {
    ### See `:help mapleader`
    keymaps = [
      ### todo
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
      }
    ];
  };
}
