### https://nixos.wiki/wiki/Samba
### https://gist.github.com/vy-let/a030c1079f09ecae4135aebf1e121ea6 (see comments in gist)
### configure login with smbpasswd (based on users already on the system)
### (jill) wanted to try to see if I could break the config if I had bad directory names, but it won't reproduce
{pkgs, ...}: {
  services.samba = {
    enable = true;

    securityType = "user";
    openFirewall = true;
    extraConfig = ''
      browseable = yes
      smb encrypt = required
      server min protocol = SMB3_00
    '';
    shares = {
      foo = {
        path = "/export/betty";
        writable = "true";
        comment = "4T";
      };
    };
  };

  ### wsdd used to advertise the shares to Windows hosts.
  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  services.nfs.server = {
    enable = true;

    # fixed rpc.statd port; for firewall (NFSv3 support)
    lockdPort = 4001;
    mountdPort = 4002;
    statdPort = 4000;
    extraNfsdConfig = '''';

    exports = ''
      /export/deal
    '';
  };

  fileSystems."/export/betty" = {
    device = "/run/media/archoo/super-4T";
    options = ["bind"];
  };
}
