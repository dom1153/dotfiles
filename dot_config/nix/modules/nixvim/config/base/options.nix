### VVV this 'config' import is needed for nixivm module, despite what nil tells you
{config, ...}: {
  config = {
    extraConfigLua = builtins.readFile ./lua/options.lua;

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

      ### indent wrapped lines
      breakindent = true;

      ### Case-insensitive searching UNLESS \C or capital in search
      ignorecase = true;
      smartcase = true;
      grepprg = "rg --vimgrep";
      grepformat = "%f:%l:%c:%m";

      ### Keep signcolumn on by default, prevents the screen from jumping
      signcolumn = "yes";

      ### Decrease update time
      updatetime = 50; ### 4000ms by default, try 50, 250
      timeoutlen = 10; ### (used for which-key)

      # Set completeopt to have a better completion experience
      completeopt = ["menuone" "noselect" "noinsert"]; # mostly just for cmp

      # Enable persistent undo history
      swapfile = false;
      backup = false;
      undofile = true;

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
        # eol = "↲";
      };

      ### Preview substitutions live, as you type!
      inccommand = "split";

      ### Show which line your cursor is on
      cursorline = true;

      # Set fold settings
      # These options were reccommended by nvim-ufo
      # See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
      foldcolumn = "0";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;

      ### Minimal number of screen lines to keep above and below the cursor.
      scrolloff = 8;

      ### Set highlight on search, but clear on pressing <Esc> in normal mod
      hlsearch = true;

      ### Enables 24-bit RGB color in the |TUI|.
      termguicolors = true;

      # Set encoding type
      encoding = "utf-8";
      fileencoding = "utf-8";

      # More space in the neovim command line for displaying messages
      cmdheight = 2;

      # Maximum number of items to show in the popup menu (0 means "use available screen space")
      pumheight = 0;

      # save before executing certain commands
      autowrite = true;

      # Use conform-nvim for gq formatting. ('formatexpr' is set to vim.lsp.formatexpr(), so you can format lines via gq if the language server supports it)
      formatexpr = "v:lua.require'conform'.formatexpr()";

      ### disable text wrap by default
      wrap = false;
    };
  };
}
