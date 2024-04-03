{...}: {
  # extraConfigLua = builtins.readFile ./lua/cmp.lua;

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
          expand = "function(args) require('luasnip').lsp_expand(args.body) end";
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
            name = "nvim_lua"; # nvim lua api
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
          # {name = "vsnip";}
          # {name = "ultisnips";}
          # {name = "snippy";}
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
          "<C-Space>" = "cmp.mapping.complete()"; ### starts the completion popup
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };
      };
    };
  };
}
