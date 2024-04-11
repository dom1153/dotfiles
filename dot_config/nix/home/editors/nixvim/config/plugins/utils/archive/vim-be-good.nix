{pkgs, ...}: {
  ### a game to get you better a vim
  extraPlugins = with pkgs.vimPlugins; [
    vim-be-good
  ];
}
