{...}: {
  networking = {
    hostName = "alma-armas";

    ### NFS:
    ###   TCP 111 2049 4000 4001 4002 20048 2049
    ###   UDP 111 2049 4000 4001 4002 20048
    ### Plex:
    ###   TCP 32400 3005 8324 32469
    ###   UDP 1900 5353 32410 32412 32413 32414
    firewall = {
      allowedTCPPorts = [
        ### NFS
        111
        20048
        2049
        4000
        4001
        4002
        80
        443

        ### Plex
        32400
        3005
        8324
        32469
      ];
      allowedUDPPorts = [
        ### NFS
        111
        20048
        2049
        21027
        22000
        4000
        4001
        4002
        80
        443

        ### Plex
        1900
        5353
        32410
        32412
        32413
        32414
      ];
    };

    # nameservers = ["100.100.100.100" "8.8.8.8" "1.1.1.1"];
    # search = ["flamingo-universe.ts.net"];

    # nftables.enable = true; ### tailscale?

    ### /etc/hosts
    extraHosts = ''
      10.0.0.12 jill-stingray
      10.0.0.39 stella-hoshii
      100.118.255.88 sei-asagiri-tail
    '';
  };
}
