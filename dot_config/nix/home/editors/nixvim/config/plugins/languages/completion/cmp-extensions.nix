{...}: {
  plugins = {
    cmp-buffer = {enable = true;}; # bufffers
    cmp-cmdline = {enable = false;}; # autocomplete for cmdline
    cmp-nvim-lsp = {enable = true;}; # lsp
    cmp-path = {enable = true;}; # file system paths

    ### snippet engine is not configured?
    cmp_luasnip = {enable = true;}; # snippets
  };
}
