{
  config,
  pkgs,
  ...
}: {
  programs.nixvim = {
    ### See `:help vim.opt` and `:help option-list`
    options = {
      ### You can also add relative line numbers, for help with jumping.
      ###  Experiment for yourself to see if you like it!
      number = true;
      relativenumber = true;

      ### Enable mouse mode, can be useful for resizing splits for example!
      mouse = "a";

      ### Don't show the mode, since it's already in status line
      showmode = false;

      ### Sync clipboard between OS and Neovim.
      ###  Remove this option if you want your OS clipboard to remain independent.
      ###  See `:help 'clipboard'`
      clipboard = "unnamedplus";

      ### Enable break indent
      breakindent = true;

      ### Save undo history
      undofile = true;

      ### Case-insensitive searching UNLESS \C or capital in search
      ignorecase = true;
      smartcase = true;

      ### Keep signcolumn on by default
      signcolumn = "yes";

      ### Decrease update time
      updatetime = 250;
      timeoutlen = 300;

      ### Configure how new splits should be opened
      splitright = true;
      splitbelow = true;

      ### Sets how neovim will display certain whitespace in the editor.
      ###   See `:help 'list'`
      ###   and `:help 'listchars'`
      list = true;
      listchars = {
        tab = "» ";
        trail = "·";
        nbsp = "␣";
      };

      ### Preview substitutions live, as you type!
      inccommand = "split";

      ### Show which line your cursor is on
      cursorline = true;

      ### Minimal number of screen lines to keep above and below the cursor.
      scrolloff = 10;

      ### Set highlight on search, but clear on pressing <Esc> in normal mod
      hlsearch = true;

      ### Enables 24-bit RGB color in the |TUI|.
      termguicolors = true;
    };
  };
}
