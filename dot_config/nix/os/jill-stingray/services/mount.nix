{...}: {
  ### ntfs-3g is needed, regular ntfs gives read-only issues
  ### todo: rw is 'probably' optional
  boot.supportedFilesystems = ["ntfs" "ntfs-3g"];
  fileSystems."/run/media/archoo/DomData" = {
    device = "/dev/sda2";
    fsType = "ntfs-3g";
    options = [
      "nofail"
      "rw"
      "users"
    ];
  };
}
