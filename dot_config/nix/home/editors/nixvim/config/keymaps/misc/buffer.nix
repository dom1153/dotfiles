{...}: {
  extraConfigLua = builtins.readFile ./lua/buffer.lua;
}
