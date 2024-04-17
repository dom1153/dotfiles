{pkgs, ...}: {
  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin {
      pname = "satellite.nvim";
      version = "";
      src = pkgs.fetchFromGitHub {
        owner = "lewis6991";
        repo = "satellite.nvim";
        rev = "40eb89743e3439c66192abfc31eb3280622a5d3c";
        hash = "sha256-Ml4TjuothhuWaYPcupKWUG1HUw/oJ1zfUzZRCf+pI/4=";
      };
    })
  ];

  ### dependencies
  # extraPackages = with pkgs; [
  # ];

  extraConfigLua = builtins.readFile ./lua/satellite.lua;
}
