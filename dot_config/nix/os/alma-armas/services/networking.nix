{...}: {
  networking = {
    hostName = "alma-armas";

    ### Syncthing Gui:
    ###   TCP 8384 22000
    ###   UDP 21027 22000
    ### NFS:
    ###   TCP 111 2049 4000 4001 4002 20048 2049
    ###   UDP 111 2049 4000 4001 4002 20048
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
      ];
    };

    ### /etc/hosts
    extraHosts = ''
      10.0.0.12 jill-stingray
      10.0.0.39 stella-hoshii
      100.118.255.88 sei-asagiri-tail
    '';
  };
}
