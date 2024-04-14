{pkgs, ...}: {
  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin {
      pname = "resession.nvim";
      version = "2024-01-21";
      src = pkgs.fetchFromGitHub {
        owner = "stevearc";
        repo = "resession.nvim";
        rev = "742aba4998123fc11f490a3aeffe8f550b2cb789";
        hash = "sha256-EunVSDUOmSCW73ObfKAdl6CTJpe/mtHsIv4yvWV8GWg=";
      };
    })
    ## vimPlugins.extras ### vim dependencies
  ];

  ### dependencies
  # extraPackages = with pkgs; [
  # ];

  extraConfigLua = builtins.readFile ./lua/resession.lua;
}
