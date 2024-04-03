{pkgs, ...}: {
  ### Snippet Engine for Neovim written in Lua.
  plugins.luasnip = {
    enable = true;
    extraConfig = {
      enable_autosnippets = true;
      store_selection_keys = "<Tab>"; ### this may be blocked due to cmp
    };
    ### include friendly-snippets as well
    fromVscode = [
      {
        lazyLoad = true;
        paths = "${pkgs.vimPlugins.friendly-snippets}";
      }
    ];
  };
}
