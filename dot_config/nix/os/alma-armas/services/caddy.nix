{...}: {
  services.caddy = {
    enable = true;
    ### note: cosmos does not play well with this system
    virtualHosts = {
      ### sws
      # "alma-armas.flamingo-universe.ts.net".extraConfig = ''reverse_proxy alma-armas.flamingo-universe.ts.net:8787'';
      "alma-armas.flamingo-universe.ts.net:9797".extraConfig = ''reverse_proxy localhost:8787'';

      # "alma-armas:8787".extraConfig = ''redir alma-armas.flamingo-universe.ts.net'';

      ### deluge
      "alma-armas.flamingo-universe.ts.net:9112".extraConfig = ''reverse_proxy localhost:8112'';
      ### sonarr
      "alma-armas.flamingo-universe.ts.net:9999".extraConfig = ''reverse_proxy localhost:8989'';

      ### https://shouts.dev/articles/caddy-redirect-all-http-requests-to-https
      ### VVV note 'alma-armas' works, but not localhost
      "http://alma-armas:9798".extraConfig = ''redir https://alma-armas.flamingo-universe.ts.net:9797'';

      # "alma-armas.flamingo-universe.ts.net:9153".extraConfig = ''reverse_proxy 10.0.0.227:8989'';

      ### cosmos apps
      # "alma-armas.flamingo-universe.ts.net:9080".extraConfig = ''reverse_proxy alma-armas.flamingo-universe.ts.net:7080'';

      "alma-armas.flamingo-universe.ts.net:9200".extraConfig = ''reverse_proxy localhost:7300'';
      "alma-armas.flamingo-universe.ts.net:9201".extraConfig = ''reverse_proxy localhost:7301'';
      "alma-armas.flamingo-universe.ts.net:9202".extraConfig = ''reverse_proxy localhost:7302'';
      "alma-armas.flamingo-universe.ts.net:9203".extraConfig = ''reverse_proxy localhost:7303'';
      "alma-armas.flamingo-universe.ts.net:9204".extraConfig = ''reverse_proxy localhost:7304'';
      "alma-armas.flamingo-universe.ts.net:9205".extraConfig = ''reverse_proxy localhost:7305'';
      "alma-armas.flamingo-universe.ts.net:9206".extraConfig = ''reverse_proxy localhost:7306'';
      "alma-armas.flamingo-universe.ts.net:9207".extraConfig = ''reverse_proxy localhost:7307'';
      "alma-armas.flamingo-universe.ts.net:9208".extraConfig = ''reverse_proxy localhost:7308'';
      "alma-armas.flamingo-universe.ts.net:9209".extraConfig = ''reverse_proxy localhost:7309'';
      "alma-armas.flamingo-universe.ts.net:9210".extraConfig = ''reverse_proxy localhost:7310'';
      "alma-armas.flamingo-universe.ts.net:9211".extraConfig = ''reverse_proxy localhost:7311'';
      "alma-armas.flamingo-universe.ts.net:9212".extraConfig = ''reverse_proxy localhost:7312'';
      "alma-armas.flamingo-universe.ts.net:9213".extraConfig = ''reverse_proxy localhost:7313'';
    };
  };
}
