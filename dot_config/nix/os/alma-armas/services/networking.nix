{...}: {
  networking = {
    hostName = "alma-armas";

    ### NFS:
    ###   TCP 111 2049 4000 4001 4002 20048 2049
    ###   UDP 111 2049 4000 4001 4002 20048
    firewall = {
      allowedTCPPorts = [
        111
        20048
        2049
        4000
        4001
        4002
        80
        443
      ];
      allowedUDPPorts = [
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
