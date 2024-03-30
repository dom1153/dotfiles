{...}: {
  fileSystems."/run/media/archoo/deal" = {
    device = "alma-armas-tail:/deal";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "x-systemd.idle-timeout=600"
      "noauto"
    ];
  };

  fileSystems."/run/media/archoo/betty" = {
    device = "alma-armas-tail:/betty";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "x-systemd.idle-timeout=600"
      "noauto"
    ];
  };

  fileSystems."/run/media/archoo/radshiba" = {
    device = "alma-armas-tail:/radshiba";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "x-systemd.idle-timeout=600" # disconnects after 10 minutes (i.e. 600 seconds)
      "noauto"
    ];
  };
}
