{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    lsp-status-nvim
  ];

  extraConfigLua = builtins.readFile ./lua/lualine.lua;

  ### A blazing fast and easy to configure Neovim statusline written in Lua.
  plugins.lualine = {
    enable = true;
    # globalstatus = true; ### true makes only ever 1 statusbar
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
  };
}
