{...}: {
  services.xserver = {
    enable = true;

    xkb.layout = "us";

    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "archoo";

    ### gdm seems best for hyprland autologin (and plasma6)
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  # Hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
