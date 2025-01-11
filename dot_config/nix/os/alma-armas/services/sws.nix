{pkgs, ...}: {
  ### https://nixos.wiki/wiki/Static_Web_Server
  environment.systemPackages = with pkgs; [
    static-web-server
  ];

  # static web server (sws)
  services.static-web-server = {
    enable = true;
    ### consider using /srv/sws , but shouldn't really matter
    ### will not generate any files, ore even this folder. just serves
    root = "/run/media/archoo/super-4T/sws/dist";

    # listen = "[::]:443"; ### if we want to change port
    ### extraOptions for sws
    configuration = {
      general = {
        ### journalctl -u static-web-server.service --since="30 min ago"
        log-level = "trace";
        directory-listing = true;
        # http2 = true;
        ### sudo tailscale cert alma-armas.flamingo-universe.ts.net
        # http2-tls-cert = "/home/archoo/.config/tls/alma-armas.flamingo-universe.ts.net.crt";
        # http2-tls-key = "/home/archoo/.config/tls/alma-armas.flamingo-universe.ts.net.key";
        # http2-tls-cert = "/var/lib/acme/alma-armas.duckdns.org/fullchain.pem";
        # http2-tls-key = "/var/lib/acme/alma-armas.duckdns.org/key.pem";
        # # Info here: https://static-web-server.net/features/security-headers/
        # # This option is only needed for versions prior to 2.18.0, after which it defaults to true
        # security-headers = true;
      };
    };
  };

  ### (acme)
  ### Now we need to override some things in the systemd unit files to allow access to those TLS certs, starting with creating a new Linux group:
  # users.groups.www-data = {};

  ### This strategy can be useful to override other advanced features as-needed
  # systemd.services.static-web-server.serviceConfig.SupplementaryGroups = pkgs.lib.mkForce ["" "www-data"];
  # systemd.services.static-web-server.serviceConfig.BindReadOnlyPaths = pkgs.lib.mkForce ["/run/media/archoo/super-4T/sws" "/home/archoo/.config/tls"];

  # systemd.services.static-web-server.serviceConfig.BindReadOnlyPaths = pkgs.lib.mkForce ["/run/media/archoo/super-4T/sws" "/var/lib/acme/alma-armas.duckdns.org"];

  ### 8787 for sws (default)
  networking.firewall.allowedTCPPorts = [8787];
}
