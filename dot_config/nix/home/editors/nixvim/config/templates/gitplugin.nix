{pkgs, ...}: {
  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin {
      pname = "CUSTOMPACKAGENAME.nvim";
      version = "YYYY-MM-DD";
      ### nix-prefetch-github --nix
      src = pkgs.fetchFromGitHub {
        owner = "";
        repo = "";
        rev = "";
        hash = "";
      };
    })
    ## vimPlugins.extras ### vim dependencies
  ];

  ### dependencies
  # extraPackages = with pkgs; [
  # ];

  extraConfigLua = builtins.readFile ./lua/PLUGINNAME.lua;
}
