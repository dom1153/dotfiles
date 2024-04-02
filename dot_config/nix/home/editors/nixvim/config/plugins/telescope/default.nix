{pkgs, ...}: {
  imports = [
  ];

  extraPackages = with pkgs; [
    ripgrep ### reccomended for telescope
    fd ### find alternative, reccomended for (telescope)
    ### :checkhealth
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
      "<leader>b" = {
        action = "buffers, {}";
        desc = "buffers";
      };
    };
  };
}
