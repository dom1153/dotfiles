{...}: {
  ### leap with s + two characters
  ### replacements: s = cl (or xi) ; S = cc
  ###  visual mode: s = c ; S = Vc / c
  plugins.leap = {
    enable = true;
  };

  extraConfigLua = builtins.readFile ./lua/leap.lua;
}
