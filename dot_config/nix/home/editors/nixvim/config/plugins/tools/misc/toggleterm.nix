{pkgs, ...}: {
  ### A neovim plugin to persist and toggle multiple terminals during an editing session
  plugins.toggleterm = {
    enable = true;
    ### float, tab, vertical
    # openMapping = "<c-/>";
  };

  extraConfigLua = builtins.readFile ./lua/toggleterm.lua;

  ### TODO: convert to lua
  keymaps = [
  ];
}
