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
  programs = {
    mosh.enable = true;
  };

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

  services.tailscale = {
    enable = true;
    package = unstable.tailscale;
    permitCertUid = "caddy"; # gives permission to for caddy to read tailscale's dns information
  };

  services.caddy = { # journalctl -xeu caddy.service
    enable = true;
    virtualHosts = {
      # '${machineName}/' resolve to tailnet url in the browser
      "http://${machineName}".extraConfig = ''redir https://${tailnetDomain}{uri}'';

      "${tailnetDomain}".extraConfig = ''
        handle_path / {
            redir https://${tailnetDomain}:9000
        }
        handle_path /dashy* {
            redir https://${tailnetDomain}:9000
        }
        handle_path /deluge* {
            redir https://${tailnetDomain}:9001
        }
        handle_path /plex* {
            redir https://${tailnetDomain}:9002
        }
      '';

      "${tailnetDomain}:9000".extraConfig = ''reverse_proxy http://localhost:8080''; # DASHY
      "${tailnetDomain}:9001".extraConfig = ''reverse_proxy http://localhost:8112''; # DELUGE
      "${tailnetDomain}:9002".extraConfig = ''reverse_proxy http://localhost:32400''; # PLEX
    };
  };

  virtualisation.docker.enable = true;

  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "${pkgs.gnome-session}/bin/gnome-session";
  services.xrdp.openFirewall = true;
  services.gnome.gnome-remote-desktop.enable = true;
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;
}
