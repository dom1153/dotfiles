{pkgs, ...}: {
  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin {
      pname = "compiler.nvim";
      version = "2024-03-07";
      src = pkgs.fetchFromGitHub {
        owner = "Zeioth";
        repo = "compiler.nvim";
        rev = "a0fc34e3aa6c8109863441fc674cf04de6241bd0";
        hash = "sha256-KIIQ1rtL9A1tZpjNNKUb5yACXGS97uaLAzCd9AogAqk=";
      };
    })
    vimPlugins.overseer-nvim
  ];

  extraConfigLua = builtins.readFile ./lua/compiler.lua;
}
