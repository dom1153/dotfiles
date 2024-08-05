{...}: {
  services.caddy = {
    enable = true;
    ### note: cosmos does not play well with this system
    virtualHosts = {
      ### sws
      # "alma-armas.flamingo-universe.ts.net".extraConfig = ''reverse_proxy alma-armas.flamingo-universe.ts.net:8787'';
      "alma-armas.flamingo-universe.ts.net:9797".extraConfig = ''reverse_proxy alma-armas.flamingo-universe.ts.net:8787'';

      # "alma-armas:8787".extraConfig = ''redir alma-armas.flamingo-universe.ts.net'';

      ### deluge
      "alma-armas.flamingo-universe.ts.net:9112".extraConfig = ''reverse_proxy alma-armas.flamingo-universe.ts.net:8112'';

      # "alma-armas.flamingo-universe.ts.net:9153".extraConfig = ''reverse_proxy 10.0.0.227:8989'';

      ### cosmos apps
      # "alma-armas.flamingo-universe.ts.net:9080".extraConfig = ''reverse_proxy alma-armas.flamingo-universe.ts.net:7080'';

      # "alma-armas.flamingo-universe.ts.net:9200".extraConfig = ''reverse_proxy 10.0.0.227:7200'';
      # "alma-armas.flamingo-universe.ts.net:9201".extraConfig = ''reverse_proxy alma-armas.flamingo-universe.ts.net:7201'';
      # "alma-armas.flamingo-universe.ts.net:9202".extraConfig = ''reverse_proxy alma-armas.flamingo-universe.ts.net:7201'';
      # "alma-armas.flamingo-universe.ts.net:9203".extraConfig = ''reverse_proxy alma-armas.flamingo-universe.ts.net:7203'';
      # "alma-armas.flamingo-universe.ts.net:9204".extraConfig = ''reverse_proxy alma-armas.flamingo-universe.ts.net:7204'';
      # "alma-armas.flamingo-universe.ts.net:9205".extraConfig = ''reverse_proxy alma-armas.flamingo-universe.ts.net:7205'';
      # "alma-armas.flamingo-universe.ts.net:9206".extraConfig = ''reverse_proxy alma-armas.flamingo-universe.ts.net:7206'';
      # "alma-armas.flamingo-universe.ts.net:9207".extraConfig = ''reverse_proxy 10.0.0.227:7207'';
      # "alma-armas.flamingo-universe.ts.net:9208".extraConfig = ''reverse_proxy alma-armas.flamingo-universe.ts.net:7208'';
      # "alma-armas.flamingo-universe.ts.net:9209".extraConfig = ''reverse_proxy alma-armas.flamingo-universe.ts.net:7209'';
      # "alma-armas.flamingo-universe.ts.net:9210".extraConfig = ''reverse_proxy alma-armas.flamingo-universe.ts.net:7210'';
      # "alma-armas.flamingo-universe.ts.net:9211".extraConfig = ''reverse_proxy alma-armas.flamingo-universe.ts.net:7211'';
      # "alma-armas.flamingo-universe.ts.net:9212".extraConfig = ''reverse_proxy alma-armas.flamingo-universe.ts.net:7212'';
      # "alma-armas.flamingo-universe.ts.net:9213".extraConfig = ''reverse_proxy alma-armas.flamingo-universe.ts.net:7213'';
    };
  };
}
