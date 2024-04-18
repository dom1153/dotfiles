{pkgs, ...}: {
  imports = [
    # ./telescope-all-recent.nix
    ./telescope-emoji.nix
    ./telescope-glyph.nix
  ];

  extraConfigLua = builtins.readFile ./lua/telescope.lua;

  ### optional dependencies - treesitter, lsp, nvim-web-devicons
  ### plenary seems to get auto-installed thanks to nixvim
  extraPackages = with pkgs; [
    ripgrep ### reccomended for telescope
    fd ### find alternative, reccomended for (telescope)
  ];

  extraPlugins = with pkgs.vimPlugins; [
    nvim-web-devicons ### optional ; (installing it *just works*)
  ];

  ### telescope.nvim is a highly extendable fuzzy finder over lists
  plugins.telescope = {
    enable = true;

    defaults = {
      mappings = {
        # i = {
        #   "<esc>" = {
        #     __raw = ''
        #       function(...)
        #         return require("telescope.actions").close(...)
        #       end'';
        #   };
        # };
      };
      layout_config = {
        # preview_cutoff = 60; ### setting preview doesn't let it autocollapse
        # prompt_position = "top";
      };
    };

    extraOptions = {
      pickers = {
        colorscheme = {
          enable_preview = true;
        };
      };
    };

    ### https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions
    extensions = {
      fzf-native.enable = true; ### sorting go REALLY fast
      frecency = {
        enable = true;
      };
      undo = {
        enable = true;
        # mappings = {
        #   i = {
        #     "<cr>" = "yank_additions";
        #     "<s-cr>" = "yank_deletions";
        #     "<c-cr>" = "restore";
        #   };
        # };
      };
    };

    ### for searching hidden files, use mini.files
    keymaps = {
      "<leader><space>" = {
        action = "find_files, {}";
        desc = "Files";
      };
      "<leader>/" = {
        action = "live_grep";
        desc = "Grep (root dir)";
      };
      "<leader>f:" = {
        action = "command_history, {}";
        desc = "Command History";
      };
      "<leader>ft" = {
        action = "builtin, {}";
        desc = "Telescope Pickers";
      };
      "<leader>gs" = {
        action = "git_status, {}";
        desc = "Status";
      };
      ### git_files (tracked files ; excludes things like node_modules)
      "<leader>gf" = {
        action = "git_files, {}";
        desc = "Search git files";
      };
      "<leader>gd" = {
        action = "git_bcommits, {}";
        desc = "See commit diffs for current file";
      };

      ### 'find'
      "<leader>f\'" = {
        action = "marks, {}";
        desc = "Jump to Mark";
      };
      "<leader>f/" = {
        action = "current_buffer_fuzzy_find, {}";
        desc = "Search (buffer)";
      };

      ### vim related
      "<leader>vo" = {
        action = "vim_options, {}";
        desc = "Options";
      };
      "<leader>vc" = {
        action = "commands, {}";
        desc = "Commands";
      };
      "<leader>vh" = {
        action = "help_tags, {}";
        desc = "Help pages";
      };
      "<leader>vi" = {
        action = "highlights, {}";
        desc = "Highlight Groups";
      };
      "<leader>vk" = {
        action = "keymaps, {}";
        desc = "Keymaps";
      };
      "<leader>vm" = {
        action = "man_pages, {}";
        desc = "Man pages";
      };
      "<leader>vr" = {
        action = "oldfiles, {}";
        desc = "Old Files (Global)";
      };
    };
  };
}
