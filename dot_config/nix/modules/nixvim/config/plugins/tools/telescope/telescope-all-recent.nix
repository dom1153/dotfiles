{pkgs, ...}: {
  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin {
      pname = "telescope-all-recent.nvim";
      version = "2024-03-04";
      src = pkgs.fetchFromGitHub {
        owner = "prochri";
        repo = "telescope-all-recent.nvim";
        rev = "b47ef2069e91f128d19c24ca231b204a553edfcf";
        hash = "sha256-N47qfj9zFvIHMzjYjK9Eyhng645SPoBPai4B1A+mrpQ=";
      };
    })
    vimPlugins.sqlite-lua ### causes a janky error after first install, but works after :)
    vimPlugins.dressing-nvim ### optional
  ];

  extraConfigLua = builtins.readFile ./lua/telescope-all-recent.lua;
}
