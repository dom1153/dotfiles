### https://nixos.wiki/wiki/Samba
### https://gist.github.com/vy-let/a030c1079f09ecae4135aebf1e121ea6 (see comments in gist)
### configure login with smbpasswd (based on users already on the system)
{pkgs, ...}: {
  services.samba = {
    enable = true;
    ### `samba4Full` is compiled with avahi, ldap, AD etc support (compared to the default package, `samba`)
    ### note: took a few hours to build...
    # package = pkgs.samba4Full;

    securityType = "user";
    openFirewall = true;
    extraConfig = ''
      ### probably don't need browseable but w/e
      browseable = yes
      ### Note: Breaks `smbclient -L <ip/host> -U%` by default, might require the client to set `client min protocol`?
      smb encrypt = required
      server min protocol = SMB3_00
    '';
    shares = {
      betty = {
        path = "/export/betty";
        writable = "true";
        comment = "4T";
      };
      deal = {
        path = "/export/deal";
        writable = "true";
        comment = "700G";
      };
      radshiba = {
        path = "/export/radshiba";
        writable = "true";
        comment = "500G";
      };
    };
  };

  ### wsdd used to advertise the shares to Windows hosts.
  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };
}
