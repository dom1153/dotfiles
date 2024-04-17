{...}: {
  extraConfigLua = builtins.readFile ./lua/comment.lua;

  plugins.comment = {
    enable = true;
  };
}
