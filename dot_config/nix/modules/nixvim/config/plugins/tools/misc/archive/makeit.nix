{pkgs, ...}: {
  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin {
      pname = "makeit.nvim";
      version = "2024-03-09";
      src = pkgs.fetchFromGitHub {
        owner = "Zeioth";
        repo = "makeit.nvim";
        rev = "016713bc5b7ea2d845ee65c38c098d8dded42e00";
        hash = "sha256-Jjk3/N/nQeALIUDNrpmVrwbJ7uZbokIunxAT3bSLOaU=";
      };
    })
    vimPlugins.overseer-nvim
  ];

  extraConfigLua = builtins.readFile ./lua/makeit.lua;
}
