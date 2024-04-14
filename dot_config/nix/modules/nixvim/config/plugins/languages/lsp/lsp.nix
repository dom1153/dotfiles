{...}: {
  extraConfigLua = builtins.readFile ./lua/lsp.lua;

  ### for config setups see :h lspconfig-all
  plugins.lsp = {
    enable = true;

    capabilities = "offsetEncoding =  'utf-16'";
    servers = {
      ### c++
      clangd = {enable = true;};

      ### lua
      lua-ls = {
        enable = true;
        extraOptions = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace";
              };
              telemetry = {
                enabled = false;
              };
              hint = {enable = true;};
            };
          };
        };
      };

      ### nix
      nil_ls = {enable = true;};

      ### js / ts
      tsserver = {
        enable = true;
        filetypes = ["javascript" "javascriptreact" "typescript" "typescriptreact"];
        extraOptions = {
          settings = {
            javascript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true;
                includeInlayFunctionLikeReturnTypeHints = true;
                includeInlayFunctionParameterTypeHints = true;
                includeInlayParameterNameHints = "all";
                includeInlayParameterNameHintsWhenArgumentMatchesName = true;
                includeInlayPropertyDeclarationTypeHints = true;
                includeInlayVariableTypeHints = true;
              };
            };
            typescript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true;
                includeInlayFunctionLikeReturnTypeHints = true;
                includeInlayFunctionParameterTypeHints = true;
                includeInlayParameterNameHints = "all";
                includeInlayParameterNameHintsWhenArgumentMatchesName = true;
                includeInlayPropertyDeclarationTypeHints = true;
                includeInlayVariableTypeHints = true;
              };
            };
          };
        };
      };
      eslint = {enable = true;};

      ### Static Type Checker for Python
      pyright = {enable = true;};

      ### python lsp
      ruff-lsp = {enable = true;};

      ### rust
      rust-analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
        settings = {
          checkOnSave = true;
          check = {
            command = "clippy";
          };
          # inlayHints = {
          #   enable = true;
          #   showParameterNames = true;
          #   parameterHintsPrefix = "<- ";
          #   otherHintsPrefix = "=> ";
          # };
          procMacro = {
            enable = true;
          };
        };
      };
    };

    keymaps = {
      silent = true;
      ### these keybinds should only be relevant if the lsp is available for the buffer
      lspBuf = {
        gd = {
          action = "definition";
          desc = "Goto Definition";
        };
        #   gr = {
        #     action = "references";
        #     desc = "Goto References";
        #   };
        #   gD = {
        #     action = "declaration";
        #     desc = "Goto Declaration";
        #   };
        #   gI = {
        #     action = "implementation";
        #     desc = "Goto Implementation";
        #   };
        #   gT = {
        #     action = "type_definition";
        #     desc = "Type Definition";
        #   };
        # K = {
        #   action = "hover";
        #   desc = "Hover";
        # };
        #   "<leader>cw" = {
        #     action = "workspace_symbol";
        #     desc = "Workspace Symbol";
        #   };
        #   "<leader>cr" = {
        #     action = "rename";
        #     desc = "Rename";
        #   };
        # "<leader>ca" = {
        #   action = "code_action";
        #   desc = "Code Action";
        # };
        # "<C-k>" = {
        #   action = "signature_help";
        #   desc = "Signature Help";
        # };
        # };
        # diagnostic = {
        #   "<leader>cd" = {
        #     action = "open_float";
        #     desc = "Line Diagnostics";
        #   };
        #   "[d" = {
        #     action = "goto_next";
        #     desc = "Next Diagnostic";
        #   };
        #   "]d" = {
        #     action = "goto_prev";
        #     desc = "Previous Diagnostic";
        #   };
      };
    };
  };
}
