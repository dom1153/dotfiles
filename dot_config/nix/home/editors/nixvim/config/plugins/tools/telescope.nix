{pkgs, ...}: {
  imports = [
  ];

  ### optional dependencies - treesitter, lsp, nvim-web-devicons
  ### plenary seems to get auto-installed thanks to nixvim
  extraPackages = with pkgs; [
    ripgrep ### reccomended for telescope
    fd ### find alternative, reccomended for (telescope)
  ];

  ### telescope.nvim is a highly extendable fuzzy finder over lists
  plugins.telescope = {
    enable = true;

    defaults = {
      layout_config = {
        preview_cutoff = 60;
        prompt_position = "top";
      };
    };

    extensions = {
      fzf-native.enable = true; ### sorting go REALLY fast
    };

    extraOptions = {
      pickers = {
        colorscheme = {
          enable_preview = true;
        };
      };
    };

    defaults = {
      mappings = {
        i = {
          "<esc>" = {
            __raw = ''
              function(...)
                return require("telescope.actions").close(...)
              end'';
          };
        };
      };
    };

    keymaps = {
      ### todo: git_files remap (e.g. ignore node_modules)
      "<leader><space>" = {
        action = "find_files, {}";
        desc = "Files";
      };
      "<leader>/" = {
        action = "live_grep";
        desc = "Grep (root dir)";
      };
      "<leader>:" = {
        action = "command_history, {}";
        desc = "Command History";
      };
      "<leader>bf" = {
        action = "buffers, {}";
        desc = "Search buffers";
      };
    };
  };
}
