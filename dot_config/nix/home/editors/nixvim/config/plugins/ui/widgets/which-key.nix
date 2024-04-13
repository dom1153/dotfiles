{...}: {
  extraConfigLua = builtins.readFile ./lua/which-key.lua;

  ### displays a popup with possible key bindings of the command you started typing
  plugins.which-key = {
    enable = true;
    icons = {
      breadcrumb = "»";
      separator = "-"; ### alt: ➜ 
      group = ""; ### use custom icons :)
    };
    disable = {
      buftypes = [
      ];
      filetypes = [
        "TelescopePrompt"
      ];
    };
  };
}
