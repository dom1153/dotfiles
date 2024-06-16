{
  pkgs,
  config,
  ...
}: {
  ### root
  environment.etc."nextcloud-admin-pass".text = "dKPVjbMku$u5";

  ### this app is very stateful, don't expect much from nixos side
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud28;
    # hostName = "localhost";
    ### url we access the http://{HOSTNAME}/settings/admin/overview
    hostName = "alma-armas";
    config.adminpassFile = "/etc/nextcloud-admin-pass";

    ### don't use extraApps, just try
    # Instead of using pkgs.nextcloud28Packages.apps,
    # we'll reference the package version specified above
    ### "bookmarks", "calendar", "contacts", "deck", "keeweb", "mail", "news", "notes", "onlyoffice", "polls", "tasks", "twofactor_webauthn"
    # extraApps = {
    #   inherit (config.services.nextcloud.package.packages.apps) news contacts calendar tasks;
    # };
    # extraAppsEnable = true;
  };
}
