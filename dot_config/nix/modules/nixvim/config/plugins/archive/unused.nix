{pkgs, ...}: {
  plugins = {
    ### neovim statusline
    lualine = {
      enable = true;
      iconsEnabled = true;
    };

    ### git decorations for the gutter column
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

    ### Library of 35+ independent Lua modules
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

        # pairs = {};
      };
    };

    ### highlight and search for todo comments like TODO, HACK, BUG in your code base.
    ### breaks :nomess????
    todo-comments = {
      enable = true;
      # signs = false;
    };

    ### telescope.nvim is a highly extendable fuzzy finder over lists
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

    ### A completion engine
    ### TODO: keymaps
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        experimental = {
          ghost_text = true;
        };
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
          __raw = ''
              cmp.mapping.preset.insert {
              -- Select the [n]ext item
              ['<C-n>'] = cmp.mapping.select_next_item(),
              -- Select the [p]revious item
              ['<C-p>'] = cmp.mapping.select_prev_item(),

              -- Accept ([y]es) the completion.
              --  This will auto-import if your LSP supports it.
              --  This will expand snippets if the LSP sent a snippet.
              ['<C-y>'] = cmp.mapping.confirm { select = true },

              -- Manually trigger a completion from nvim-cmp.
              --  Generally you don't need this, because nvim-cmp will display
              --  completions whenever it has completion options available.
              ['<C-Space>'] = cmp.mapping.complete {},

              -- Think of <c-l> as moving to the right of your snippet expansion.
              --  So if you have a snippet that's like:
              --  function $name($args)
              --    $body
              --  end
              --
              -- <c-l> will move you to the right of each of the expansion locations.
              -- <c-h> is similar, except moving you backwards.
              ['<C-l>'] = cmp.mapping(function()
                if luasnip.expand_or_locally_jumpable() then
                  luasnip.expand_or_jump()
                end
              end, { 'i', 's' }),
              ['<C-h>'] = cmp.mapping(function()
                if luasnip.locally_jumpable(-1) then
                  luasnip.jump(-1)
                end
              end, { 'i', 's' }),
            }
          '';
          # "<Tab>" = ''
          #   function(fallback)
          #    	if cmp.visible() then
          #   		cmp.select_next_item()
          #   elseif luasnip.expand_or_jumpable() then
          #   	luasnip.expand_or_jump()
          #   else
          #   fallback()
          #        end
          #   end
          # '';
        };
      };
    };
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp-buffer.enable = true;
    cmp_luasnip.enable = true;
    cmp-cmdline.enable = false;

    friendly-snippets.enable = true;

    ### language server protocal
    ### TODO: keymaps for lsp (go defenition, etc)
    lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true; ### nix
        clangd.enable = true; ### c++
        ### typescript
        tsserver = {
          enable = true;
          filetypes = ["javascript" "javascriptreact" "typescript" "typescriptreact"];
        };
        lua-ls = {
          enable = true;
          settings.telemetry.enable = false;
        };
        rust-analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
      };
    };
    ### This tiny plugin adds vscode-like pictograms to neovim built-in lsp:
    lspkind = {
      enable = true;
      symbolMap = {
        Copilot = "";
      };
      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };

    ### better syntax highlighting
    treesitter = {
      enable = true;
      indent = true;
    };

    ### A vim-vinegar like file explorer that lets you edit your filesystem like a normal Neovim buffer.
    oil = {
      enable = false;
    };

    ### Noice (Nice, Noise, Notice)
    ### Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
    noice = {
      enable = true;
    };

    dashboard = {
      enable = true;
    };

    ### DAP (Debug Adapter Protocol)
    ### TODO: keymaps
    dap = {
      enable = true;
      signs = {
        dapBreakpoint = {
          text = "●";
          texthl = "DapBreakpoint";
        };
        dapBreakpointCondition = {
          text = "●";
          texthl = "DapBreakpointCondition";
        };
        dapLogPoint = {
          text = "◆";
          texthl = "DapLogPoint";
        };
      };
      extensions = {
        dap-python = {
          enable = true;
        };
        dap-ui = {
          enable = true;
          floating.mappings = {
            close = ["<ESC>" "q"];
          };
        };
        dap-virtual-text = {
          enable = true;
        };
      };
      configurations = {
        java = [
          {
            type = "java";
            request = "launch";
            name = "Debug (Attach) - Remote";
            hostName = "127.0.0.1";
            port = 5005;
          }
        ];
      };
    };
  };

  ### See `:help mapleader`
  keymaps = [
    {
      mode = "n";
      key = "<leader>qa";
      action = "<cmd>quitall<cr><esc>";
      options = {
        silent = true;
        desc = "Quit all";
      };
    }

    {
      mode = "n";
      key = "<leader>ul";
      action = ":lua ToggleLineNumber()<cr>";
      options = {
        silent = true;
        desc = "Toggle Line Numbers";
      };
    }

    {
      mode = "n";
      key = "<leader>uL";
      action = ":lua ToggleRelativeLineNumber()<cr>";
      options = {
        silent = true;
        desc = "Toggle Relative Line Numbers";
      };
    }

    {
      mode = "n";
      key = "<leader>uw";
      action = ":lua ToggleWrap()<cr>";
      options = {
        silent = true;
        desc = "Toggle Line Wrap";
      };
    }

    ### option.nix
    {
      mode = "n";
      key = "<leader>u";
      action = "+options";
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

  plugins.mini = {
    enable = true;
    modules = {
      comment = {
        options = {
          customCommentString = ''
            <cmd>lua require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring<cr>
          '';
        };
      };
      cursorword = {};
    };
  };

  keymaps = [
    {
      mode = ["n"];
      key = "<leader>e";
      action = "<cmd>lua MiniFiles.open()<cr>";
      options = {
        desc = "Open mini";
      };
    }
  ];

  ### A blazing fast and easy to configure Neovim statusline written in Lua.
  plugins.lualine = {
    enable = false;
    alwaysDivideMiddle = true;
    globalstatus = true;
    ignoreFocus = ["neo-tree"];
    extensions = ["fzf"];
    theme = "auto";
    componentSeparators = {
      left = "|";
      right = "|";
    };
    sectionSeparators = {
      left = "█"; # 
      right = "█"; # 
    };
    sections = {
      lualine_a = ["mode"];
      lualine_b = [
        {
          name = "branch";
          icon = "";
        }
        "diff"
        "diagnostics"
      ];
      lualine_c = ["filename"];
      lualine_x = ["filetype"];
      lualine_y = ["progress"];
      lualine_z = [''" " .. os.date("%R")''];
    };
  };

  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "staline.nvim";
      version = "2024-02-05";
      src = pkgs.fetchFromGitHub {
        owner = "tamton-aquib";
        repo = "staline.nvim";
        rev = "a53f869278b8b186a5afd6f21680cd103c381599";
        hash = "sha256-GDMKzxFDtQk5LL+rMsxTGTyLv69w5NUd+u19noeO5ws=";
      };
    })
  ];

  ### (Nice, Noise, Notice)
  ### Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
  ### separated into modules
  ###   Main use here is for stackable messages in the bottom right
  ###   And nice :cmd popup in the center
  plugins.noice = {
    enable = true; ### temporary until we get status message...
    notify = {
      enabled = false;
    };
    messages = {
      enabled = true; # Adds a padding-bottom to neovim statusline when set to false for some reason
    };
    lsp = {
      message = {
        enabled = true;
      };
      progress = {
        enabled = false;
        view = "mini";
      };
    };
    popupmenu = {
      enabled = true;
      backend = "nui";
    };
    format = {
      filter = {
        pattern = [":%s*%%s*s:%s*" ":%s*%%s*s!%s*" ":%s*%%s*s/%s*" "%s*s:%s*" ":%s*s!%s*" ":%s*s/%s*"];
        icon = "";
        lang = "regex";
      };
      replace = {
        pattern = [":%s*%%s*s:%w*:%s*" ":%s*%%s*s!%w*!%s*" ":%s*%%s*s/%w*/%s*" "%s*s:%w*:%s*" ":%s*s!%w*!%s*" ":%s*s/%w*/%s*"];
        icon = "󱞪";
        lang = "regex";
      };
      ### TODO: tab help 
    };

    routes = [
      {
        view = "notify";
        filter = {
          event = "msg_showmode";
        };
      }
    ];

    ### see nixvim for default commands setup
    ### https://nix-community.github.io/nixvim/plugins/noice/index.html
    commands = {
      history = {
        view = "popup"; ### default 'split'
        opts = {
          enter = true;
          format = "details";
        };
        filter = {
          any = [
            {event = "notify";}
            {error = true;}
            {warning = true;}
            {
              event = "msg_show";
              kind = [""];
            }
            {
              event = "lsp";
              kind = "message";
            }
          ];
        };
      };
      last = {
        view = "popup";
        opts = {
          enter = true;
          format = "details";
        };
        filter = {
          any = [
            {event = "notify";}
            {error = true;}
            {warning = true;}
            {
              event = "msg_show";
              kind = [""];
            }
            {
              event = "lsp";
              kind = "message";
            }
          ];
        };
        filter_opts = {count = 1;};
      };
      errors = {
        view = "popup";
        opts = {
          enter = true;
          format = "details";
        };
        filter = {error = true;};
        filter_opts = {reverse = true;};
      };
    };
  };
}
