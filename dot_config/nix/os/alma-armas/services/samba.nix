### https://nixos.wiki/wiki/Samba
{...}: {
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    extraConfig = ''
      workgroup = WORKGROUP
      server string = smbnix
      netbios name = smbnix
      security = user
      #use sendfile = yes
      #max protocol = smb2
      # note: localhost is the ipv6 localhost ::1
      hosts allow = 192.168.0. 127.0.0.1 localhost
      hosts deny = 0.0.0.0/0
      guest account = nobody
      map to guest = bad user
    '';
    shares = {
      public = {
        path = "/exort/deal";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "username";
        "force group" = "groupname";
      };
      private = {
        path = "/export/dawson";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "username";
        "force group" = "groupname";
      };
    };
  };

  ### wsdd used to advertise the shares to Windows hosts.
  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  ### bind mounts so we don't have to move them
  ### named and organized based on abc order
  # fileSystems."/export/shares/private/4T" = {
  #   device = "/run/media/archoo/super-4T";
  #   options = ["bind"];
  # };

  # fileSystems."/export/deal" = {
  #   device = "/run/media/archoo/lamp-700G";
  #   options = ["bind"];
  # };

  # fileSystems."/export/dawson" = {
  #   device = "/run/media/archoo/fuzzy-500G";
  #   options = ["bind"];
  # };
}
