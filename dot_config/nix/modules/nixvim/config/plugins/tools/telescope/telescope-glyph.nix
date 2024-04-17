{pkgs, ...}: {
  ### nerdfont telescope search (ported from emoji and cheatsheet.nix)
  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin {
      pname = "telescope-glyph.nvim";
      version = "2022-08-22";
      src = pkgs.fetchFromGitHub {
        owner = "ghassan0";
        repo = "telescope-glyph.nvim";
        rev = "f63f01e129e71cc25b79637610674bbf0be5ce9d";
        hash = "sha256-6H4afMXtaZn066oBq3z8vvR7WH7WhqZkvziyOXlsNVg=";
      };
    })
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>fn";
      action = "<cmd>Telescope glyph<CR>";
      options = {
        desc = "Nerdfont picker";
      };
    }
  ];

  extraConfigLua = builtins.readFile ./lua/telescope-glyph.lua;
}
