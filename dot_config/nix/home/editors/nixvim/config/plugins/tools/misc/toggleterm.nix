{pkgs, ...}: {
  ### A neovim plugin to persist and toggle multiple terminals during an editing session
  plugins.toggleterm = {
    enable = true;
    ### float, tab, vertical
    # openMapping = "<c-/>";
  };

  extraConfigLua = builtins.readFile ./lua/toggleterm.lua;

  ### TODO: convert to lua
  keymaps = [
    ### vertical split
    {
      mode = "n";
      key = "<leader>tV";
      action = "<cmd>ToggleTerm direction=vertical name=Terminal-Vertical<CR>";
      options = {
        desc = "Terminal Vertical Split (root)";
      };
    }

    {
      mode = "n";
      key = "<leader>tv";
      action = "<cmd>ToggleTerm dir=%:p:h direction=vertical name=Terminal-Vertical-cwd<CR>";
      options = {
        desc = "Terminal Vertical Split (cwd)";
      };
    }

    ### horizontal split
    {
      mode = "n";
      key = "<leader>th";
      action = "<cmd>ToggleTerm dir=%:p:h direction=horizontal name=Terminal-Horizontal-cwd<CR>";
      options = {
        desc = "Terminal Horizontal Split (cwd)";
      };
    }

    {
      mode = "n";
      key = "<leader>tH";
      action = "<cmd>ToggleTerm direction=horizontal name=Terminal-Horizontal<CR>";
      options = {
        desc = "Terminal Horizontal Split (root)";
      };
    }
    ### float
    {
      mode = "n";
      key = "<leader>tf";
      action = "<cmd>ToggleTerm dir=%:p:h direction=float name=Terminal-Float<CR>";
      options = {
        desc = "Terminal Float";
      };
    }

    {
      mode = "n";
      key = "<leader>tF";
      action = "<cmd>ToggleTerm direction=float name=Terminal-Float<CR>";
      options = {
        desc = "Terminal Float";
      };
    }

    ### term

    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>ToggleTerm dir=%:p:h direction=tab name=Terminal-Tab<CR>";
      options = {
        desc = "Terminal Tab";
      };
    }

    {
      mode = "n";
      key = "<leader>tT";
      action = "<cmd>ToggleTerm direction=tab name=Terminal-Tab<CR>";
      options = {
        desc = "Terminal Tab";
      };
    }
  ];
}
