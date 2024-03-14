{...}: {
  programs.nixvim = {
    ### See `:help mapleader`
    keymaps = [
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
    ];

    extraConfigLua = ''
      function ToggleLineNumber()
      if vim.wo.number then
        vim.wo.number = false
      else
        vim.wo.number = true
          vim.wo.relativenumber = false
          end
          end

          function ToggleRelativeLineNumber()
          if vim.wo.relativenumber then
            vim.wo.relativenumber = false
          else
            vim.wo.relativenumber = true
              vim.wo.number = false
            end
          end

          function ToggleWrap()
            if vim.wo.wrap then
              vim.wo.wrap = false
            else
              vim.wo.wrap = true
                vim.wo.number = false
            end
          end

         if vim.lsp.inlay_hint then
           vim.keymap.set('n', '<leader>uh', function()
             vim.lsp.inlay_hint(0, nil)
           end, { desc = 'Toggle Inlay Hints' })
         end
    '';
  };
}
