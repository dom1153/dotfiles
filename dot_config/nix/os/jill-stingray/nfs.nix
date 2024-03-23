{...}: {
  fileSystems."/run/media/archoo/deal" = {
    device = "alma-armas.local:/deal";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "x-systemd.idle-timeout=600"
      "noauto"
    ];
  };

  fileSystems."/run/media/archoo/betty" = {
    device = "alma-armas.local:/betty";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "x-systemd.idle-timeout=600"
      "noauto"
    ];
  };

  fileSystems."/run/media/archoo/dawson" = {
    device = "alma-armas.local:/dawson";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "x-systemd.idle-timeout=600" # disconnects after 10 minutes (i.e. 600 seconds)
      "noauto"
    ];
  };
}
