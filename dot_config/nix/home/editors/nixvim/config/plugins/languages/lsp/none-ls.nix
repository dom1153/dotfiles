{...}: {
  ### Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.

  ### todo move this to none-ls ????
  plugins.lsp-format = {
    enable = false; # Enable it if you want lsp-format integration for none-ls
  };

  plugins.none-ls = {
    enable = false;
    enableLspFormat = false;
    updateInInsert = false;
    onAttach = ''
      function(client, bufnr)
          if client.supports_method "textDocument/formatting" then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format { bufnr = bufnr }
              end,
            })
          end
        end
    '';
    sources = {
      code_actions = {
        gitsigns.enable = true;
        statix.enable = true;
      };

      diagnostics = {
        checkstyle = {enable = true;};
        statix = {enable = true;};
      };
      formatting = {
        alejandra = {enable = true;};

        prettier = {
          enable = true;
          withArgs = ''
            {
              extra_args = { "--no-semi", "--single-quote" },
            }
          '';
        };

        google_java_format = {enable = true;};

        stylua = {enable = true;};

        ### python
        black = {
          enable = true;
          withArgs = ''
            {
              extra_args = { "--fast" },
            }
          '';
        };
      };
    };
  };

  # keymaps = [
  #   {
  #     mode = [ "n" "v" ];
  #     key = "<leader>cf";
  #     action = "<cmd>lua vim.lsp.buf.format()<cr>";
  #     options = {
  #       silent = true;
  #       desc = "Format";
  #     };
  #   }
  # ];
}
