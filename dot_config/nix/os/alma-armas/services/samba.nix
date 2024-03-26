### https://nixos.wiki/wiki/Samba
### https://gist.github.com/vy-let/a030c1079f09ecae4135aebf1e121ea6 (see comments)
{...}: {
  services.samba = {
    enable = true;
    # VVV `samba4Full` is compiled with avahi, ldap, AD etc support (compared to the default package, `samba`
    package = pkgs.samba4Full;

    securityType = "user";
    openFirewall = true;
    extraConfig = ''
      browseable = yes
      ### VVV Note: Breaks `smbclient -L <ip/host> -U%` by default, might require the client to set `client min protocol`?
      smb encrypt = required
      server min protocol = SMB3_00
    '';
    shares = {
      test = {
        path = "/export/dawson";
        writable = "true";
        comment = "Hello World!";
      };
      # public = {
      #   path = "/exort/dawson";
      #   browseable = "yes"; # note: each home will be browseable; the "homes" share will not.
      #   "read only" = "no";
      #   "guest ok" = "no";
      #   # browseable = "yes";
      #   # "read only" = "no";
      #   # "guest ok" = "yes";
      #   # "create mask" = "0644";
      #   # "directory mask" = "0755";
      #   # "force user" = "username";
      #   # "force group" = "groupname";
      # };
      # private = {
      #   path = "/export/dawson";
      #   browseable = "yes";
      #   "read only" = "no";
      #   "guest ok" = "no";
      #   "create mask" = "0644";
      #   "directory mask" = "0755";
      #   "force user" = "username";
      #   "force group" = "groupname";
      # };
    };

    avahi = {
      publish.userServices = true;
      # ^^ Needed to allow samba to automatically register mDNS records (without the need for an `extraServiceFile`
      nssmdns4 = true;
      # ^^ Not one hundred percent sure if this is needed- if it aint broke, don't fix it
      enable = true;
      openFirewall = true;
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
