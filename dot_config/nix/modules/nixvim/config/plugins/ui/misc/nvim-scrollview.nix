{pkgs, ...}: {
  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin {
      pname = "nvim-scrollview.nvim";
      version = "2024-03-20";
      src = pkgs.fetchFromGitHub {
        owner = "dstein64";
        repo = "nvim-scrollview";
        rev = "5a7eb7e6c1b921761615b57a6140d73b1cc2b034";
        hash = "sha256-doC0/phf1DoJ/xTUZVyIfNrSA9c60vwKqAv4nAKObAE=";
      };
    })
  ];

  ### dependencies
  # extraPackages = with pkgs; [
  # ];

  extraConfigLua = builtins.readFile ./lua/nvim-scrollview.lua;
}
