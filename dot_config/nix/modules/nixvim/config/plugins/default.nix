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
  };
}
