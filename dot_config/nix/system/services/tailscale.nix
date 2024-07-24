{inputs, ...}: let
  unstable = import inputs.nixpkgs-unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
in {
  services.tailscale = {
    enable = true;
    package = unstable.tailscale;
    # useRoutingFeatures = "server";
  };
}
