{...}: {
  fileSystems."/run/media/archoo/deal" = {
    device = "alma-armas.local:/deal";
    fsType = "nfs";
    label = "deal";
    options = [
      "x-systemd.automount"
      "x-systemd.idle-timeout=600"
      "noauto"
    ];
  };

  fileSystems."/run/media/archoo/betty" = {
    device = "alma-armas.local:/betty";
    fsType = "nfs";
    label = "betty";
    options = [
      "x-systemd.automount"
      "x-systemd.idle-timeout=600"
      "noauto"
    ];
  };

  fileSystems."/run/media/archoo/radshiba" = {
    device = "alma-armas.local:/radshiba";
    fsType = "nfs";
    label = "radshiba";
    options = [
      "x-systemd.automount"
      "x-systemd.idle-timeout=600" # disconnects after 10 minutes (i.e. 600 seconds)
      "noauto"
    ];
  };
}
