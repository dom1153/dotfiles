{pkgs, ...}: {
  imports = [
    ./languages
    ./tools
    ./ui
    ./utils
  ];

  extraPlugins = with pkgs.vimPlugins; [
    vim-sleuth ### Automatically adjusts 'shiftwidth' and 'expandtab' heuristically
  ];

  plugins = {
    comment.enable = true; ### comment lines with gc command
    surround.enable = true; ### parentheses, brackets, quotes, XML tags, and more
  };

  ### keepthing this here for convenience
  # extraConfigLua = builtins.readFile ./lua/file.lua;
}
