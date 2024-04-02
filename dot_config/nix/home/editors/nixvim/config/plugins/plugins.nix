{pkgs, ...}: {
  imports = [
    ./languages/languages.nix
    ./tools/tools.nix
    ./ui/ui.nix
    ./utils/utils.nix
  ];

  extraPlugins = with pkgs.vimPlugins; [
    vim-sleuth ### Automatically adjusts 'shiftwidth' and 'expandtab' heuristically
  ];

  plugins = {
    comment.enable = true; ### comment lines with gc command
  };
}
