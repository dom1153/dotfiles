{
  pkgs,
  lib,
  config,
  ...
}: {
  # We can also set options:
  config = {
    options = {
      tabstop = 4;
      shiftwidth = 4;
      expandtab = false;

      mouse = "a";

      # etc...
    };
  };
}
