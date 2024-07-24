{inputs, ...}: let
  unstable = import inputs.nixpkgs-unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
in {
  services.plex = {
    enable = true;
    openFirewall = true;
    user = "archoo";
    dataDir = "/run/media/archoo/super-4T/";
    package = unstable.plex;
  };
}
