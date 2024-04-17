{pkgs, ...}: {
  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin {
      pname = "buffer_manager.nvim";
      version = "2024-01-18";
      ### nix-prefetch-github --nix
      src = pkgs.fetchFromGitHub {
        owner = "j-morano";
        repo = "buffer_manager.nvim";
        rev = "9cd0e34522d96d08817828f1e9fd3379f27efb73";
        hash = "sha256-YL+ypkQAkEbhbOZedD+9frr+5nMBXjEnLCYroeLGNYM=";
      };
    })
    vimPlugins.plenary-nvim ### dep
  ];

  ### dependencies
  # extraPackages = with pkgs; [
  # ];

  extraConfigLua = builtins.readFile ./lua/buffer_manager.lua;
}
