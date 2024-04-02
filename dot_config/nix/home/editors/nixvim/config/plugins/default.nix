{pkgs, ...}: {
  imports = [
    ./languages
    ./telescope
    # ./ui
    # ./utils
  ];

  extraPlugins = with pkgs.vimPlugins; [
    vim-sleuth ### Automatically adjusts 'shiftwidth' and 'expandtab' heuristically
  ];

  plugins = {
    comment.enable = true; ### comment lines with gc command
  };
}
