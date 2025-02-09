{
  inputs,
  pkgs,
  ...
}: let
  ### v25+ for healthcheck.start_interval (immich)
  stable = import inputs.nixpkgs-stable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in {
  virtualisation.docker = {
    enable = true;
    rootless.package = stable.docker;
    package = stable.docker;
  };
  users.users.archoo.extraGroups = ["docker"];
}
