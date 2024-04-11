{pkgs, ...}: {
  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin {
      pname = "telescope-emoji.nvim";
      version = "2022-12-08";
      src = pkgs.fetchFromGitHub {
        owner = "xiyaowong";
        repo = "telescope-emoji.nvim";
        rev = "86248d97be84a1ce83f0541500ef9edc99ea2aa1";
        hash = "sha256-8V3MTporANLtZkH0RuLviWlgMmR6fay0WmZ3ZOQzpKI=";
      };
    })
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>fe";
      action = "<cmd>Telescope emoji<CR>";
      options = {
        desc = "Emoji picker";
      };
    }
  ];

  extraConfigLua = builtins.readFile ./lua/telescope-emoji.lua;
}
