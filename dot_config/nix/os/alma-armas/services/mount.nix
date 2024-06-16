{...}: {
  ### lsblk -o name,mountpoint,label,size,uuid
  fileSystems."/run/media/archoo/lamp-700G" = {
    device = "/dev/disk/by-uuid/66C5574E674DAEDD";
    # fsType = "ntfs";
    fsType = "ntfs-3g";
    options = [
      "nofail"
      "rw"
      "users"
    ];
  };

  fileSystems."/run/media/archoo/super-4T" = {
    device = "/dev/disk/by-uuid/967AC4B27AC49103";
    # fsType = "ntfs";
    fsType = "ntfs-3g";
    options = [
      "nofail"
      "rw"
      # "users"
    ];
  };

  fileSystems."/run/media/archoo/fuzzy-500G" = {
    device = "/dev/disk/by-uuid/22DC1805279A1C23";
    # fsType = "ntfs";
    fsType = "ntfs-3g";
    options = [
      "nofail"
      "rw"
      "users"
    ];
  };
}
