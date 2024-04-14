### cool plugin, but harpoon and telescope make this seem unneeded
{...}: {
  imports = [
  ];

  programs.nixvim = {
    plugins = {
      ### Neo-tree is a Neovim plugin to browse the file system and other tree like structures in whatever style suits you
      ### including sidebars, floating windows, netrw split style, or all of them at once!
      neo-tree = {
        enable = true;
        enableDiagnostics = false;
        closeIfLastWindow = true;
        popupBorderStyle = "single"; # Type: null or one of “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code
        buffers = {
          bindToCwd = false;
        };
        window = {
          mappings = {
            "<space>" = "none";
          };
          position = "right";
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = ":Neotree toggle reveal_force_cwd<cr>";
        options = {
          silent = true;
          desc = "Explorer NeoTree (root dir)";
        };
      }
      {
        mode = "n";
        key = "<leader>E";
        action = "<cmd>Neotree toggle<CR>";
        options = {
          silent = true;
          desc = "Explorer NeoTree (cwd)";
        };
      }
      # {
      #   mode = "n";
      #   key = "<leader>be";
      #   action = ":Neotree buffers<CR>";
      #   options = {
      #     silent = true;
      #     desc = "Buffer explorer";
      #   };
      # }
      {
        mode = "n";
        key = "<leader>ge";
        action = ":Neotree git_status<CR>";
        options = {
          silent = true;
          desc = "Git explorer";
        };
      }
    ];
  };
}
