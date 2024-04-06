{...}: {
  ### displays a popup with possible key bindings of the command you started typing
  plugins.which-key = {
    enable = true;
  };

  keymaps = [
    ### tab.nix
    {
      mode = "n";
      key = "<leader>t";
      action = "+tab";
    }

    ### window.nix
    {
      mode = "n";
      key = "<leader>w";
      action = "+window";
    }

    ### buffers.nix
    {
      mode = "n";
      key = "<leader>b";
      action = "+buffers";
    }

    {
      mode = "n";
      key = "<leader>f";
      action = "+find";
    }

    {
      mode = "n";
      key = "<leader>g";
      action = "+git";
    }

    {
      mode = "n";
      key = "<leader>v";
      action = "+vim";
    }
  ];
}
