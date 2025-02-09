{pkgs, ...}: {
  boot = {
    bootspec.enable = true;

    ### todo: does this make nixos-generate-config recognize my harddrives???
    initrd = {
      systemd.enable = true;
      supportedFilesystems = ["ntfs" "ntfs-3g"];
    };

    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];

    loader = {
      # systemd-boot on UEFI
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    plymouth = {
      enable = false;
      theme = "catppuccin-mocha";
      themePackages = with pkgs; [
        (catppuccin-plymouth.override {variant = "mocha";})
      ];
    };
  };
}
