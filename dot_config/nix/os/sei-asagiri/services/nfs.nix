{...}: {
  fileSystems."/run/media/archoo/deal" = {
    device = "alma-armas.flamingo-universe.ts.net:/deal";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "x-systemd.idle-timeout=600"
      "noauto"
    ];
  };

  fileSystems."/run/media/archoo/betty" = {
    device = "alma-armas.flamingo-universe.ts.net:/betty";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "x-systemd.idle-timeout=600"
      "noauto"
    ];
  };

  fileSystems."/run/media/archoo/radshiba" = {
    device = "alma-armas.flamingo-universe.ts.net:/radshiba";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "x-systemd.idle-timeout=600" # disconnects after 10 minutes (i.e. 600 seconds)
      "noauto"
    ];
  };
}
