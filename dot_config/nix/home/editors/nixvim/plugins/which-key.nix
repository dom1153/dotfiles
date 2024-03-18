{...}: {
  imports = [
  ];

  programs.nixvim = {
    plugins = {
      ### displays a popup with possible key bindings of the command you started typing
      which-key = {
        enable = true;
      };
    };

    keymaps = [
      ### tab.nix
      {
        mode = "n";
        key = "<leader><Tab>";
        action = "+tab";
      }

      ### option.nix
      {
        mode = "n";
        key = "<leader>u";
        action = "+options";
      }

      ### window.nix
      {
        mode = "n";
        key = "<leader>w";
        action = "+window";
      }

      {
        mode = "n";
        key = "<leader>q";
        action = "+session";
      }

      {
        mode = "n";
        key = "<leader>g";
        action = "+git";
      }

      {
        mode = "n";
        key = "<leader>f";
        action = "+find";
      }

      {
        mode = "n";
        key = "<leader>s";
        action = "+search";
      }
    ];
  };
}
