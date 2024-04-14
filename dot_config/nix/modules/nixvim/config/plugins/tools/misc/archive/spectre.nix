{pkgs, ...}: {
  ### A search and replace panel for neovim. (think vscode)
  extraPlugins = with pkgs.vimPlugins; [
    nvim-spectre
    plenary-nvim
  ];
}
