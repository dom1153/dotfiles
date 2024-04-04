{pkgs, ...}: {
  services.xserver = {
    displayManager.autoLogin.enable = true;
    # displayManager.defaultSession = "plasma";
    services.xserver.displayManager.sddm.enable = true;
    # displayManager.defaultSession = "plasmawayland";
  };

  ### doesn't seem to help with hyprland vscode
  security.pam.services.gdm.enableGnomeKeyring = true;

  ### DNS resolver (this will definetly break stuff / wifi without proper config)
  # resolved.enable = true;

  services.kmscon = {
    enable = true;
    fonts = [
      {
        name = "dina"; ### wants font-size=10 ; fixed
        package = pkgs.dina-font;
      }
    ];

    ### autologinuser: potentially only useful running headless ; breaks desktop manager otherwise
    ### font-dpi: dpi should be multiples of 96
    extraConfig = ''
      autologinUser = "archoo";
      font-size=10
      font-dpi=192
    '';
  };
}
