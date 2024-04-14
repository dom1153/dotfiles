{config, ...}: {
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
  ];

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
