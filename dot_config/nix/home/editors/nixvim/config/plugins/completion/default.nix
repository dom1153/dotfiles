{...}: {
  imports = [
    ./lspkind.nix
  ];

  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };
        snippet = {
          expand = "luasnip";
        };
        formatting = {
          fields = ["kind" "abbr" "menu"];
          expandableIndicator = true;
        };
        window = {
          completion = {
            border = "rounded";
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
          };
          documentation = {
            border = "rounded";
          };
        };

        sources = [
          {
            name = "nvim_lsp"; # lsp
          }
          {
            name = "buffer"; # text within current buffer
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keywordLength = 3;
          }
          {
            name = "path"; # file system paths
            keywordLength = 3;
          }
          {
            name = "luasnip"; # snippets
            keywordLength = 3;
          }
        ];

        mapping = {
          ### todo try lsp-zero function
          ### todo consider adding c-exit
          "<Tab>" = ''
            cmp.mapping(function()
              if cmp.visible() then
                cmp.select_next_item({behavior = 'insert'})
              else
                cmp.complete()
              end
            end)
          '';

          "<S-Tab>" = ''
            cmp.mapping(function()
              if cmp.visible() then
                cmp.select_prev_item({behavior = 'insert'})
              else
                cmp.complete()
              end
            end)
          '';

          "<C-j>" = "cmp.mapping.scroll_docs(-4)";
          "<C-k>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };
      };
    };

    ### cmp extensions
    cmp-nvim-lsp = {enable = true;}; # lsp
    cmp-buffer = {enable = true;}; # bufffers
    cmp-path = {enable = true;}; # file system paths
    cmp_luasnip = {enable = true;}; # snippets
    cmp-cmdline = {enable = false;}; # autocomplete for cmdline
  };
}
