{...}: let
  hostname = "jill-stingray.flamingo-universe.ts.net";
  ### some cool looping; however, can't map to the same tailscale port for ssl :(
  # simplePorts = [8972 2283 5230 3001 3005 8881 8787 9000];
  # stringPorts = map (x: toString x) simplePorts;
  # simpleHostsMapping = builtins.listToAttrs (
  #   map
  #   (p: {
  #     name = "${hostname}:${p}";
  #     value = {
  #       extraConfig = "
  #         reverse_proxy http://localhost:${p}
  #         tls internal
  #       ";
  #     };
  #   })
  #   stringPorts
  # );
in {
  services.caddy = {
    enable = true;
    virtualHosts = {
      "${hostname}:443".extraConfig = ''reverse_proxy http://localhost:8787''; ### sws
      "${hostname}:4001".extraConfig = ''reverse_proxy http://localhost:8972''; ### hoarder
      "${hostname}:4002".extraConfig = ''reverse_proxy http://localhost:2283''; ### immich
      "${hostname}:4003".extraConfig = ''reverse_proxy http://localhost:5230''; ### memos
      "${hostname}:4004".extraConfig = ''reverse_proxy http://localhost:3001''; ### silverbullet
      "${hostname}:4005".extraConfig = ''reverse_proxy http://localhost:3005''; ### gitea
      "${hostname}:4006".extraConfig = ''reverse_proxy http://localhost:9000''; ### portainer
      "${hostname}:4007".extraConfig = ''reverse_proxy http://localhost:8881''; ### seafile
      "${hostname}:4008".extraConfig = ''reverse_proxy http://localhost:8112''; ### deluge
      "${hostname}:4009".extraConfig = ''reverse_proxy http://localhost:8096''; ### jellyfin
      "${hostname}:4010".extraConfig = ''reverse_proxy http://localhost:8082''; ### dashy
      "${hostname}:4011".extraConfig = ''reverse_proxy http://localhost:8081''; ### glance
    };
    # // simpleHostsMapping;
  };
}
