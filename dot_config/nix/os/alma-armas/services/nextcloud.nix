{
  pkgs,
  config,
  ...
}: {
  ### root
  environment.etc."nextcloud-admin-pass".text = "dKPVjbMku$u5";

  ### probably consuming port 80 via nginx

  ### this app is very stateful, don't expect much from nixos side
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud28;
    # hostName = "localhost";
    ### url we access the http://{HOSTNAME}/settings/admin/overview
    #### 20655, randomly picked with https://proxyscrape.com/tools/random-port-generator
    hostName = "alma-armas";
    config.adminpassFile = "/etc/nextcloud-admin-pass";
    # home = "/run/media/archoo/super-4T/appdata/nextcloud"; ### "/var/lib/nextcloud"
    # datadir = "/run/media/archoo/super-4T/appdata/nextcloud"; ### config.services.nextcloud.home

    # settings = let
    #   prot = "http"; # or https
    #   host = "alma-armas";
    #   dir = "/nextcloud";
    # in {
    #   overwriteprotocol = prot;
    #   overwritehost = host;
    #   overwritewebroot = dir;
    #   overwrite.cli.url = "${prot}://${host}${dir}/";
    #   htaccess.RewriteBase = dir;
    # };
    #
    ### don't use extraApps, just try
    # Instead of using pkgs.nextcloud28Packages.apps,
    # we'll reference the package version specified above
    ### "bookmarks", "calendar", "contacts", "deck", "keeweb", "mail", "news", "notes", "onlyoffice", "polls", "tasks", "twofactor_webauthn"
    # extraApps = {
    #   inherit (config.services.nextcloud.package.packages.apps) news contacts calendar tasks;
    # };
    # extraAppsEnable = true;
  };

  # services.nginx.virtualHosts."alma-armas".listen = [
  #   {
  #     addr = "127.0.0.1";
  #     port = 8080; # NOT an exposed port
  #   }
  # ];
  # #
  # services.nginx.virtualHosts."alma-armas".locations = {
  #   "^~ /.well-known" = {
  #     priority = 9000;
  #     extraConfig = ''
  #       absolute_redirect off;
  #       location ~ ^/\\.well-known/(?:carddav|caldav)$ {
  #         return 301 /nextcloud/remote.php/dav;
  #       }
  #       location ~ ^/\\.well-known/host-meta(?:\\.json)?$ {
  #         return 301 /nextcloud/public.php?service=host-meta-json;
  #       }
  #       location ~ ^/\\.well-known/(?!acme-challenge|pki-validation) {
  #         return 301 /nextcloud/index.php$request_uri;
  #       }
  #       try_files $uri $uri/ =404;
  #     '';
  #   };
  #   "/nextcloud/" = {
  #     priority = 9999;
  #     extraConfig = ''
  #       proxy_set_header X-Real-IP $remote_addr;
  #       proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  #       proxy_set_header X-NginX-Proxy true;
  #       proxy_set_header X-Forwarded-Proto http;
  #       proxy_pass http://127.0.0.1:8080/; # tailing / is important!
  #       proxy_set_header Host $host;
  #       proxy_cache_bypass $http_upgrade;
  #       proxy_redirect off;
  #     '';
  #   };
  # };
}
