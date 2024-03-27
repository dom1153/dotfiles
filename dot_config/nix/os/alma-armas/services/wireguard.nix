### https://nixos.wiki/wiki/WireGuard
### https://wireguard.how/client/macos/
### /etc/wireguard/*.conf
{pkgs, ...}: {
  networking = {
    nat = {
      enable = true;
      externalInterface = "eth0";
      internalInterfaces = ["wg0aa"]; ### must match interface name below
    };
  };

  networking.wireguard.interfaces = {
    ### "wg0aa" is the network interface name. You can name the interface arbitrarily.
    wg0aa = {
      ### Determines the IP address and subnet of the server's end of the tunnel interface.
      ips = ["10.100.0.1/24"];

      ### The port that WireGuard listens to. Must be accessible by the client.
      listenPort = 51820;

      ### This allows the wireguard server to route your traffic to the internet and hence be like a VPN
      ### For this to work you have to set the dnsserver IP of your router (or dnsserver of choice) in your clients
      postSetup = ''
        ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
      '';

      ### This undoes the above command
      postShutdown = ''
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
      '';

      ### https://superuser.com/questions/1247947/how-to-name-openssh-public-and-private-key-pairs
      ### id_<key_algorithm>_<servername>_<pubpriv>.<format_information>
      privateKeyFile = "/home/archoo/.wg/id_wg_alma_armas_private.wg";

      peers = [
        {
          publicKey = "AG/ktphWmXKGmX0pD3bYybxy6GCuVTkX6899wzGTfCU=";
          # List of IPs assigned to this peer within the tunnel subnet. Used to configure routing.
          allowedIPs = ["10.100.0.2/32"];
        }
      ];
    };
  };
}
