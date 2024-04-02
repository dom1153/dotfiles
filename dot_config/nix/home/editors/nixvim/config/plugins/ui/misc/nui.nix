{pkgs, ...}: {
  ### UI Component Library for Neovim. (why is this here)
  extraPlugins = with pkgs.vimPlugins; [nui-nvim];
}
