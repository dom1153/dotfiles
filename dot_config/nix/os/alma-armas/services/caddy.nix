{lib, ...}: let
  hostname = "alma-armas.flamingo-universe.ts.net";
  magicname = builtins.head (lib.strings.splitString "." hostname);
in {
  services.caddy = {
    enable = true;
    virtualHosts = {
      ### '${magicname}/' should just resolve in the browser!
      "http://${magicname}".extraConfig = ''redir https://${hostname}:443'';

      "${hostname}:443".extraConfig = ''reverse_proxy http://localhost:7540'';

      "${hostname}:9531".extraConfig = ''reverse_proxy http://localhost:7531''; ### HOARDER
      "${hostname}:9532".extraConfig = ''reverse_proxy http://localhost:2283''; ### IMMICH
      "${hostname}:9533".extraConfig = ''reverse_proxy http://localhost:5230''; ### MEMOS
      "${hostname}:9534".extraConfig = ''reverse_proxy http://localhost:3001''; ### SILVERBULLET
      "${hostname}:9535".extraConfig = ''reverse_proxy http://localhost:7535''; ### GITEA
      "${hostname}:9536".extraConfig = ''reverse_proxy http://localhost:7536''; ### PORTAINER
      "${hostname}:9537".extraConfig = ''reverse_proxy http://localhost:7537''; ### SEAFILE
      "${hostname}:9538".extraConfig = ''reverse_proxy http://localhost:7538''; ### SWS
      "${hostname}:9539".extraConfig = ''reverse_proxy http://localhost:7539''; ### DELUGE
      "${hostname}:9540".extraConfig = ''reverse_proxy http://localhost:7540''; ### DASHY
      "${hostname}:9541".extraConfig = ''reverse_proxy http://localhost:7541''; ### GATUS
    };
  };
}
