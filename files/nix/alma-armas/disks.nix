{...}: let
  share750 = "badtouch";
  disk750 = "/mnt/badtouch-750G";
  export750 = "/export/badtouch";

  share2T = "gutpunch";
  disk2T = "/export/gutpunch";
  export2T = "/mnt/gutpunch-750G";

  share4T = "moonblast";
  disk4T = "/export/moonblast";
  export4T = "/mnt/moonblast-2T";
in {
  fileSystems.${disk750} = {
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

  fileSystems."/mnt/gutpunch-2T" = {
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

  fileSystems."/mnt/moonblast-4T" = {
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

  fileSystems.${export750} = {
    device = "${disk750}";
    options = ["bind"];
  };

  fileSystems.${export2T} = {
    device = "${disk2T}";
    options = ["bind"];
  };

  fileSystems.${export4T} = {
    device = "${disk4T}";
    options = ["bind"];
  };

  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    shares = {
      ${share750} = {
        path = "${export750}";
        writable = "true";
        comment = "750G";
      };
      ${share2T} = {
        path = "${export2T}";
        writable = "true";
        comment = "2T";
      };
      ${share4T} = {
        path = "${export4T}";
        writable = "true";
        comment = "4T";
      };
    };
  };

  ### advertise the shares to Windows hosts.
  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };
}
