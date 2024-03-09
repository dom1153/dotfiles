{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      vim-sleuth
      #   {
      #     plugin = dressing-nvim;
      #     config = "lua require('dressing').setup()";
      #   }
    ];

    plugins = {
      comment-nvim.enable = true;

      conform-nvim = {
        enable = true;
        notifyOnError = false;
        formatOnSave = {
          timeoutMs = 500;
          lspFallback = true;
        };
        formattersByFt = {
          lua = ["stylua"];
          # Conform will run multiple formatters sequentially
          python = ["isort" "black"];
          # Use a sub-list to run only the first available formatter
          javascript = [["prettierd" "prettier"]];
          # Use the "*" filetype to run formatters on all filetypes.
          #   "*" = ["codespell"];
          # Use the "_" filetype to run formatters on filetypes that don't
          # have other formatters configured.
          "_" = ["trim_whitespace"];
        };
      };

      lualine = {
        enable = true;
        iconsEnabled = true;
      };

      gitsigns = {
        enable = true;
        signs = {
          add.text = "+";
          change.text = "~";
          delete.text = "_";
          topdelete.text = "‾";
          changedelete.text = "~";
        };
      };

      mini = {
        enable = true;
        modules = {
          ### Better Around/Inside textobjects
          ###
          ### Examples:
          ###  - va)  - [V]isually select [A]round [)]paren
          ###  - yinq - [Y]ank [I]nside [N]ext [']quote
          ###  - ci'  - [C]hange [I]nside [']quote
          ai = {
            n_lines = 500;
          };

          ### Add/delete/replace surroundings (brackets, quotes, etc.)
          ###
          ### - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
          ### - sd'   - [S]urround [D]elete [']quotes
          ### - sr)'  - [S]urround [R]eplace [)] [']
          surround = {};

          pairs = {};
        };
      };

      todo-comments = {
        enable = true;
        # signs = false;
      };

      which-key = {
        enable = true;
        registrations = {
          "<leader>c" = {
            name = "[C]ode";
            _ = "which_key_ignore";
          };
          "<leader>d" = {
            name = "[D]ocument";
            _ = "which_key_ignore";
          };
          "<leader>r" = {
            name = "[R]ename";
            _ = "which_key_ignore";
          };
          "<leader>s" = {
            name = "[S]earch";
            _ = "which_key_ignore";
          };
          "<leader>w" = {
            name = "[W]orkspace";
            _ = "which_key_ignore";
          };
        };
      };

      telescope = {
        enable = true;
        extensions = {
          ui-select.enable = true;
          fzf-native.enable = true;
        };
        keymaps = {
          ### todo
        };
      };

      cmp = {
        enable = true;
        ### todo
      };

      friendly-snippets.enable = true;

      lsp = {
        enable = true;
        servers = {
          tsserver.enable = true;
          lua-ls = {
            enable = true;
            settings.telemetry.enable = false;
          };
          rust-analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          ### c++
          clangd.enable = true;
          ### nix
          nil_ls.enable = true;
        };
      };

      treesitter = {
        enable = true;
        indent = true;
      };

      neo-tree = {
        enable = true;
        window = {
          position = "right";
        };
      };

      # noice = {
      #   enable = true;
      # };

      # dashboard = {
      #   enable = true;
      # };
    };
  };
}
