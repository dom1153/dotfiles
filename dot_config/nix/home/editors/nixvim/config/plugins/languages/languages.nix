{...}: {
  imports = [
    # ./completion/cmp-extensions.nix
    # ./completion/cmp.nix
    # ./completion/lspkind.nix

    ./formatter/conform.nix

    # ./lint/lint.nix

    ./lsp/lsp.nix
    # ./lsp/lspsaga.nix
    # ./lsp/trouble.nix
    # ./lsp/none-ls.nix

    # ./snippets/luasnip.nix

    # ./treesitter/context.nix
    # ./treesitter/text-objects.nix
    ./treesitter/treesitter.nix
    # ./treesitter/ts-autotag.nix
    # ./treesitter/ts-context-commentstring.nix

    # ./specific/typescript-tools-nvim.nix
  ];
}
