{pkgs, ...}: {
  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin {
      pname = "auto-session.nvim";
      version = "2024-04-14";
      ### nix-prefetch-github --nix
      src = pkgs.fetchFromGitHub {
        owner = "rmagatti";
        repo = "auto-session";
        rev = "9e0a169b6fce8791278abbd110717b921afe634d";
        hash = "sha256-wu/utBYr4o4BenybAumDxBTERBkRkcR1QzlfmnVbOTQ=";
      };
    })
    ## vimPlugins.extras ### vim dependencies
  ];

  ### dependencies
  # extraPackages = with pkgs; [
  # ];

  extraConfigLua = builtins.readFile ./lua/auto-session.lua;
}
