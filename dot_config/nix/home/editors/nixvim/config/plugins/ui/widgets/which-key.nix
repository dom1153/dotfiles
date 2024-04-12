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
      action = "+tab / term";
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

    {
      mode = "n";
      key = "<leader>u";
      action = "+ui/ux";
    }
  ];
}
