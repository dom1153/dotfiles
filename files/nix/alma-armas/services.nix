{ inputs, pkgs, lib, ... }:
let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
  tailnetDomain = "alma-armas.flamingo-universe.ts.net";
  machineName = builtins.head (lib.strings.splitString "." tailnetDomain);
in
{
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true; # works when XAUTHORITY is correctly set
    };
  };

  networking = {
    hostName = "alma-armas";
    firewall = {
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };
  };

  # gives permission to for caddy to read tailscale's dns information
  services.tailscale = {
    enable = true;
    package = unstable.tailscale;
    permitCertUid = "caddy";
  };

  services.caddy = {
    enable = true;
    virtualHosts = {
      # '${machineName}/' resolve to tailnet url in the browser
      "http://${machineName}".extraConfig = ''redir https://${tailnetDomain}:443'';

      # "${hostname}:9531".extraConfig = ''reverse_proxy http://localhost:7531'';
    };
  };

  virtualisation.docker.enable = true;
  users.users.archoo.extraGroups = [ "docker" ];
}
