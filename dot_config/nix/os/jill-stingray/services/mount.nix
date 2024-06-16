{...}: {
  ### ntfs-3g is needed, regular ntfs gives read-only issues
  ### todo: rw is 'probably' optional
  ### 'mount' can tell you the fstab details
  ### gnome.gnome-disk-utility
  ### https://askubuntu.com/questions/594197/unrecognized-mount-option-x-gvfs-show-or-missing-value
  ### dmesg | tail
  boot.supportedFilesystems = ["ntfs" "ntfs-3g"];
  fileSystems."/run/media/archoo/DomData" = {
    device = "/dev/sda2";
    # fsType = "ntfs-3g"; ### fuseblk
    fsType = "ntfs";
    options = [
      "nofail"
      # "rw"
      "uid=1000"
      "gid=100"
      "iocharset=utf8" ### general nice feature
    ];
  };

  ### unused options
  # "rw"
  # "users"
  # "nosuid"
  # "nodev"
  # "relatime" ### reduces disk writes, should be default
  # "uhelper=udisks2" ### this doesn't seem to help
}
