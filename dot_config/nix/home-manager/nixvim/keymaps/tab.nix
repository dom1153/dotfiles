{...}: {
  programs.nixvim = {
    keymaps = [
      # Tab magement via <leader><tab>
      {
        mode = "n";
        key = "<leader><tab>n";
        action = "<cmd>tabnew<cr>";
        options = {
          silent = true;
          desc = "New Tab";
        };
      }

      {
        mode = "n";
        key = "<leader><tab>t";
        action = "<cmd>tabnext<cr>";
        options = {
          silent = true;
          desc = "Next Tab";
        };
      }

      {
        mode = "n";
        key = "<leader><tab>x";
        action = "<cmd>tabclose<cr>";
        options = {
          silent = true;
          desc = "Close tab";
        };
      }

      {
        mode = "n";
        key = "<leader><tab>T";
        action = "<cmd>tabprevious<cr>";
        options = {
          silent = true;
          desc = "Previous Tab";
        };
      }
    ];

    extraConfigLua = ''
    '';
  };
}
