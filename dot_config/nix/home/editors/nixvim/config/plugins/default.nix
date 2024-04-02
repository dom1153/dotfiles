{pkgs, ...}: {
  imports = [
    ./completion

    ./formatter/conform.nix

    ./telescope

    ./ui
  ];

  extraPlugins = with pkgs.vimPlugins; [
    vim-sleuth ### Automatically adjusts 'shiftwidth' and 'expandtab' heuristically
  ];

  plugins = {
    comment.enable = true; ### comment lines with gc command
  };
}
