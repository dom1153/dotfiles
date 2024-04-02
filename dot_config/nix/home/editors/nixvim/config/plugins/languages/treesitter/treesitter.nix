{pkgs, ...}: {
  ### :checkhealth complains about `cc`, but c++ seems to function fine?
  ### perhaps OK due to nixvim injections / nixgrammers

  ### fancy syntax tree parsing / highlighting
  plugins.treesitter = {
    enable = true;
    indent = true;
    folding = true;
    nixvimInjections = true;
    # gccPackage = pkgs.clangStdenv;
  };
}
