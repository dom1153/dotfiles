{pkgs, ...}: {
  imports = [
    ./context.nix

    ./text-objects.nix

    ./ts-autotag.nix

    ./ts-context-commentstring.nix
  ];

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
