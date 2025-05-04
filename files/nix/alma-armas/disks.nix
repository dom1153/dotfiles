{ ... }:
let
  shareBT = "badtouch";
  diskBT = "/mnt/badtouch-750G";
  exportBT = "/export/badtouch";

  shareGP = "gutpunch";
  diskGP = "/export/gutpunch";
  exportGP = "/mnt/gutpunch-2T";

  shareMB = "moonblast";
  diskMB = "/export/moonblast";
  exportMB = "/mnt/moonblast-4T";
in
{
  fileSystems.${diskBT} = {
    device = "/dev/disk/by-uuid/1c3264bb-557e-4a59-943b-f42c3fdaebd8";
    options = [
      "defaults"
      "nofail"
      "noatime"
      "data=ordered"
      "barrier=1"
      "commit=60"
    ];
  };

  fileSystems.${diskGP} = {
    device = "/dev/disk/by-uuid/80856553-f679-4444-b9e3-d329468f0e06";
    fsType = "ext4";
    options = [
      "defaults"
      "nofail"
      "noatime"
      "data=ordered"
      "barrier=1"
      "commit=60"
    ];
  };

  fileSystems.${diskMB} = {
    device = "/dev/disk/by-uuid/0598e7e7-2941-46ad-b2d7-e432471f4847";
    options = [
      "defaults"
      "nofail"
      "noatime"
      "data=ordered"
      "barrier=1"
      "commit=60"
    ];
  };

  fileSystems.${exportBT} = {
    device = "${diskBT}";
    options = [ "bind" ];
  };

  fileSystems.${exportGP} = {
    device = "${diskGP}";
    options = [ "bind" ];
  };

  fileSystems.${exportMB} = {
    device = "${diskMB}";
    options = [ "bind" ];
  };

  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        security = "user";
      };
      ${shareBT} = {
        path = "${exportBT}";
        writable = "true";
      };
      ${shareGP} = {
        path = "${exportGP}";
        writable = "true";
      };
      ${shareMB} = {
        path = "${exportMB}";
        writable = "true";
      };
    };
  };

  ### advertise the shares to Windows hosts.
  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };
}
