{pkgs, ...}: {
  ### https://nixos.wiki/wiki/Static_Web_Server
  environment.systemPackages = with pkgs; [
    static-web-server
  ];

  # static web server (sws)
  services.static-web-server = {
    enable = true;
    ### consider using /srv/sws, but unsure how to do symlinks
    root = "/run/media/archoo/super-4T/sws";

    # listen = "[::]:443"; ### if we want to change port
    ### extraOptions for sws
    configuration = {
      general = {
        ### journalctl -u static-web-server.service --since="30 min ago"
        log-level = "trace";
        #   http2 = true;
        #   # Edit the domain name in the file to match your real domain name as configured in the ACME settings
        #   http2-tls-cert = "/var/lib/acme/your-domain.example/fullchain.pem";
        #   http2-tls-key = "/var/lib/acme/your-domain.example/key.pem";
        #   # Info here: https://static-web-server.net/features/security-headers/
        #   # This option is only needed for versions prior to 2.18.0, after which it defaults to true
        #   security-headers = true;
      };
    };
  };

  ### (acme)
  ### Now we need to override some things in the systemd unit files to allow access to those TLS certs, starting with creating a new Linux group:
  # users.groups.www-data = {};

  ### This strategy can be useful to override other advanced features as-needed
  # systemd.services.static-web-server.serviceConfig.SupplementaryGroups = pkgs.lib.mkForce ["" "www-data"];
  ### Note that "/some/path" should match your "root" option
  # systemd.services.static-web-server.serviceConfig.BindReadOnlyPaths = pkgs.lib.mkForce ["/some/path" "/var/lib/acme/your-domain.example"];

  ### 8787 for sws (default)
  ### 80 for the ACME challenge
  networking.firewall.allowedTCPPorts = [8787 80];
}
