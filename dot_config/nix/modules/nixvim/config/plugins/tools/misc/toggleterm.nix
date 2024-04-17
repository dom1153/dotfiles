{pkgs, ...}: {
  ### A neovim plugin to persist and toggle multiple terminals during an editing session
  plugins.toggleterm = {
    enable = true;
  };

  extraConfigLua = builtins.readFile ./lua/toggleterm.lua;
}
