{pkgs, ...}: {
  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin {
      pname = "nvim-scrollbar.nvim";
      version = "2023-05-23";
      src = pkgs.fetchFromGitHub {
        owner = "petertriho";
        repo = "nvim-scrollbar";
        rev = "35f99d559041c7c0eff3a41f9093581ceea534e8";
        hash = "sha256-zLBexSxQCn9HPY04a9w/UCJP1F5ShI2X12I9xE9H0cM=";
      };
    })
    # vimPlugins.gitsigns-nvim
    # vimPlugins.nvim-hlslens ### virtualtext
  ];

  ### dependencies
  # extraPackages = with pkgs; [
  # ];

  extraConfigLua = builtins.readFile ./lua/nvim-scrollbar.lua;
}
