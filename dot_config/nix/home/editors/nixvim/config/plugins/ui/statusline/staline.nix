{pkgs, ...}: {
  ### staline(STAtusLINE): A simple statusline for neovim written in lua.
  ### stabline(s-TABLINE): A simple bufferline for neovim written in lua. (sry didnt get a better name.)
  extraPlugins = with pkgs.vimPlugins; [
    staline-nvim
  ];

  # extraPlugins = with pkgs.vimUtils; [
  #   (buildVimPlugin {
  #     pname = "staline.nvim";
  #     version = "2024-02-05";
  #     src = pkgs.fetchFromGitHub {
  #       owner = "tamton-aquib";
  #       repo = "staline.nvim";
  #       rev = "a53f869278b8b186a5afd6f21680cd103c381599";
  #       hash = "sha256-GDMKzxFDtQk5LL+rMsxTGTyLv69w5NUd+u19noeO5ws=";
  #     };
  #   })
  # ];

  extraConfigLua = builtins.readFile ./lua/staline.lua;
}
