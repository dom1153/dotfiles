{inputs, ...}: let
  unstable = import inputs.nixpkgs-unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
in {
  services.tailscale = {
    enable = true;
    package = unstable.tailscale;
    ### caddy runs as user 'caddy', not root; so this gives permission to for caddy to read tailscale's dns information
    permitCertUid = "caddy";
  };
}
