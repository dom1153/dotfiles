{...}: {
  ### :checkhealth complains about `cc`, but c++ seems to function fine?
  ### should OK due to NixGrammers (enabled by default)

  ### fancy syntax tree parsing / highlighting
  plugins.treesitter = {
    enable = true;

    indent = true;
    folding = true;
    nixvimInjections = true; ### nixvim specific injections, like lua highlighting in extraConfigLua
  };
}
