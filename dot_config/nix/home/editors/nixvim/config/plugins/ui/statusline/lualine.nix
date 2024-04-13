{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    lsp-status-nvim
  ];

  extraConfigLua = builtins.readFile ./lua/lualine.lua;

  ### A blazing fast and easy to configure Neovim statusline written in Lua.
  plugins.lualine = {
    enable = true;
    globalstatus = true; ### false allows status on every window
    ignoreFocus = [
    ];
    extensions = [
      # "toggelterm"
    ];
    theme = "auto";
    componentSeparators = {
      # left = "|";
      # right = "|";
    };
    sectionSeparators = {
      # left = "█"; # 
      # right = "█"; # 
    };
    sections = {
      lualine_a = ["mode"];
      lualine_b = [
        {
          name = "branch";
          # icon = "";
        }
        "diff"
        "diagnostics"
      ];
      lualine_c = ["filename"];

      lualine_y = [
        "progress"
        "location"
      ];
      lualine_z = [
        "%L Line(s)"
      ];
    };

    tabline = {
      lualine_a = ["buffers"];
      lualine_z = ["tabs"];
    };

    ### can't figure out how to dispaly empty winbar bar
    # winbar = {
    #   lualine_a = [
    #     {
    #       name = "";
    #       extraConfig = {
    #         separator = " ";
    #         # draw_empty = true;
    #       };
    #     }
    #   ];
    # };
    #
    # inactiveWinbar = {
    #   lualine_a = ["filename"];
    # };
  };
}
