{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  stable = import inputs.nixpkgs-stable {
    system = pkgs.system;
    config.allowUnfree = true;
  };

  thisModule = "mycontainers";

  persistentDataRoot = config.${thisModule}.persistentDataRoot;
in {
  options.${thisModule} = {
    enable =
      lib.mkEnableOption "enables my containers";

    persistentDataRoot = lib.mkOption {
      # type = lib.types.str;
      default = "/var/lib/docker"; # Default path for Docker persistent data
      description = "Root path for persistent Docker data. Can be overridden by the user.";
    };
  };

  config =
    lib.mkIf config.${thisModule}.enable
    {
      virtualisation.oci-containers.backend = "docker";

      virtualisation.oci-containers.containers = {
        portainer = {
          image = "docker.io/portainer/portainer-ce:2.21.5";
          autoStart = true;
          ports = [
            "8000:8000"
            "9443:9443"
          ];
          volumes = [
            "/var/run/docker.sock:/var/run/docker.sock"
            "${persistentDataRoot}/portainer:/data"
          ];
        };
      };
    };
}
