{pkgs, ...}: {
  ### The first time you apply this change
  ### SWS may fail to start up if it tries to start before the initial cert is generated (the ACME client should generate a placeholder cert very quickly).
  ### If that happens, just wait a few minutes, then run systemctl restart static-web-server.service.
  ### It should then be able to load the TLS certificate.

  ### https://nixos.wiki/wiki/ACME
  ### https: requests and renews tls certificates
  security.acme = {
    acceptTerms = true;
    defaults.email = "blahblahfoobar@protonmail.com";
    certs."alma-armas.flamingo-universe.ts.net" = {
      reloadServices = ["static-web-server"];
      listenHTTP = ":19910"; ### 80 is consumed by nginx
      group = "www-data";
      # EC is not supported by SWS versions before 2.16.1
      keyType = "rsa4096";
    };
  };

  # ACME Challenge (80)
  networking.firewall.allowedTCPPorts = [19910 443];
}
