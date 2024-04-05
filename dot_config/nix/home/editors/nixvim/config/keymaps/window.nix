{...}: {
  keymaps = [
    # Manage Windows with <leader>w

    ### Navigation (standard)
    {
      mode = "n";
      key = "<leader>wh";
      action = "<C-W>h";
      options = {
        silent = true;
        desc = "Go to window left";
      };
    }

    {
      mode = "n";
      key = "<leader>wj";
      action = "<C-W>j";
      options = {
        silent = true;
        desc = "Go to window down";
      };
    }

    {
      mode = "n";
      key = "<leader>wk";
      action = "<C-W>k";
      options = {
        silent = true;
        desc = "Go to window up";
      };
    }

    {
      mode = "n";
      key = "<leader>wl";
      action = "<C-W>l";
      options = {
        silent = true;
        desc = "Go to window right";
      };
    }

    ### Navigation (arrows)
    {
      mode = "n";
      key = "<Left>";
      action = "<C-W>h";
      options = {
        silent = true;
        desc = "Go to window left";
      };
    }

    {
      mode = "n";
      key = "<Down>";
      action = "<C-W>j";
      options = {
        silent = true;
        desc = "Go to window down";
      };
    }

    {
      mode = "n";
      key = "<Up>";
      action = "<C-W>k";
      options = {
        silent = true;
        desc = "Go to window up";
      };
    }

    {
      mode = "n";
      key = "<Right>";
      action = "<C-W>l";
      options = {
        silent = true;
        desc = "Go to window right";
      };
    }

    ### Navigation (A-hjkl)
    {
      mode = "n";
      key = "<A-h>";
      action = "<C-W>h";
      options = {
        silent = true;
        desc = "Go to window left";
      };
    }

    {
      mode = "n";
      key = "<A-j>";
      action = "<C-W>j";
      options = {
        silent = true;
        desc = "Go to window down";
      };
    }

    {
      mode = "n";
      key = "<A-k>";
      action = "<C-W>k";
      options = {
        silent = true;
        desc = "Go to window up";
      };
    }

    {
      mode = "n";
      key = "<A-l>";
      action = "<C-W>l";
      options = {
        silent = true;
        desc = "Go to window right";
      };
    }

    ### create / close windows
    {
      mode = "n";
      key = "<leader>ws";
      action = "<C-W>s";
      options = {
        silent = true;
        desc = "Split window below";
      };
    }

    {
      mode = "n";
      key = "<leader>wv";
      action = "<C-W>v";
      options = {
        silent = true;
        desc = "Split window right";
      };
    }

    {
      mode = "n";
      key = "<leader>wx";
      action = "<C-W>c";
      options = {
        silent = true;
        desc = "Close window";
      };
    }

    ### Other navigation
    {
      mode = "n";
      key = "<leader>ww";
      action = "<C-W>w";
      options = {
        silent = true;
        desc = "Next windows";
      };
    }

    {
      mode = "n";
      key = "<leader>wx";
      action = "<C-W>x";
      options = {
        silent = true;
        desc = "Swap current with next";
      };
    }

    {
      mode = "n";
      key = "<leader>wp";
      action = "<C-W>p";
      options = {
        silent = true;
        desc = "Other window";
      };
    }

    ### resize
    {
      mode = "n";
      key = "<leader>w_";
      action = "<C-W>_";
      options = {
        silent = true;
        desc = "Max out the height";
      };
    }

    {
      mode = "n";
      key = "<leader>w|";
      action = "<C-W>|";
      options = {
        silent = true;
        desc = "Max out the width";
      };
    }

    {
      mode = "n";
      key = "<leader>w=";
      action = "<C-W>=";
      options = {
        silent = true;
        desc = "Equally high and wide";
      };
    }
  ];
}
