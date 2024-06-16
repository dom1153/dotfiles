{...}: {
  ### 8989
  services.sonarr = {
    enable = true;
    openFirewall = true;
    dataDir = "/run/media/archoo/super-4T/appdata/sonarr"; # "/var/lib/sonarr/.config/NzbDrone"
  };

  ### configure via gui
  ### - 'media management' (season [tvdb-###]), root folder (/run/media/archoo/super-4T/sonarr/)
  ### - download clients (deluge) -> enable 'label' plugin in deluge
  ### - indexer (https://nyaa.si)
  ### - bitwarden appears to work with 'browser popup' auth?
}
