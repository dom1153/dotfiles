{...}: {
  ### lsblk -o name,mountpoint,label,size,uuid
  ### fuseblk / ntfs doesn't allow traditional mount options qq
  # options:
  #     "uid=1000"
  #     "gid=100"
  #     "nofail"
  #     "rw"
  #     "iocharset=utf8" ### general nice feature (ntfs only?)
  #     "defaults" ### read/write, suid, dev, exec, auto, nouser, async
  #     "noatime" ### disable updating inode access time on reads (perf)
  #     "data=ordered" ### ensures metadata is comitted before data is written safety/perf
  #     "barrier=1" ### write barriers, proetcts against data loss during power failure
  #     "commit=60" ### floush journal every 60 seconds instead of 5s (longeviity
  #     "users" ### users was causing issues with plex?

  ### chmod folder to user because that's how auto mounts do it
  ### tmpfiles is made specifically for this I guess
  systemd.tmpfiles.rules = [
    "d /mnt/tasteless-2T 0775 archoo users - -"
    "d /mnt/lamp-750G 0775 archoo users - -"
    "d /mnt/super-4T 0775 archoo users - -"
  ];

  fileSystems."/mnt/tasteless-2T" = {
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

  fileSystems."/mnt/lamp-750G" = {
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

  fileSystems."/mnt/super-4T" = {
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
}
