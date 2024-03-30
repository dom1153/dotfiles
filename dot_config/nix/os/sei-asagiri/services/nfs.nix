{...}: {
  fileSystems."/run/media/archoo/deal" = {
    device = "alma-armas:/deal";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "x-systemd.idle-timeout=600"
      "noauto"
    ];
  };

  fileSystems."/run/media/archoo/betty" = {
    device = "alma-armas:/betty";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "x-systemd.idle-timeout=600"
      "noauto"
    ];
  };

  fileSystems."/run/media/archoo/radshiba" = {
    device = "alma-armas:/radshiba";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "x-systemd.idle-timeout=600" # disconnects after 10 minutes (i.e. 600 seconds)
      "noauto"
    ];
  };
}
