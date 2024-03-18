{...}: {
  boot = {
    bootspec.enable = true;

    ### todo: does this make nixos-generate-config recognize my harddrives???
    initrd = {
      systemd.enable = true;
      supportedFilesystems = ["ntfs" "ntfs-3g"];
    };

    loader = {
      # systemd-boot on UEFI
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
