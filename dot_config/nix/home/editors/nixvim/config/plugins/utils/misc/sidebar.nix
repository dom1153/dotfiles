{pkgs, ...}: {
  ### a generic sidebar (e.g. git status, diagnostics, symbols, files, containers, todo)
  ### I kinda tried to avoid the need for sidebars (distractions)
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "sidebar.nvim";
      version = "2024-02-07";
      src = pkgs.fetchFromGitHub {
        owner = "sidebar-nvim";
        repo = "sidebar.nvim";
        rev = "5695712eef6288fff667343c4ae77c54911bdb1b";
        sha256 = "1p12189367x0x26cys9wxipzwr3i0bmz4lb0s79ki0a49d6zja2c";
      };
    })
  ];

  extraConfigLua = builtins.readFile ./lua/sidebar.lua;
}
