{...}: {
  networking = {
    hostName = "alma-armas";

    ### Syncthing Gui:
    ###   TCP 8384 22000
    ###   UDP 21027 22000
    ### NFS:
    ###   TCP 111 2049 4000 4001 4002 20048 2049
    ###   UDP 111 2049 4000 4001 4002 20048
    ### comsos cloud
    ###   TCP:UDP 4242:4242
    ###   TCP/UDP 80 443 4242
    ###   TCP 9200+
    ### other (caddy)
    ###   TCP 9798 9999
    firewall = {
      allowedTCPPorts = [
        111
        20048
        2049
        2049
        22000
        4000
        4001
        4002
        8384
        80
        443
        4242
        7080
        7443

        9201
        9202
        9203
        9204
        9205
        9206
        9207
        9208
        9209
        9210
        9211
        9212
        9213

        9798
        9999
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
        4242
        7080
        7443
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
