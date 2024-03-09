{
  config,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    #viAlias = true;
    #vimAlias = true;
    #vimdiffAlias = true;
    #plugins = [
    #pkgs.vimPlugins.nvim-treesitter.withAllGrammars
    #];
  };
}
