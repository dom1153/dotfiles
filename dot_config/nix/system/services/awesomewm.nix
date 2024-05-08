{pkgs, ...}: {
  services.xserver = {
    enable = true;

    ### xfce enable (no wm)
    # desktopManager = {
    #   xterm.enable = false;
    #   xfce = {
    #     enable = true;
    #     noDesktop = true;
    #     enableXfwm = false;
    #   };
    # };
    #
    displayManager = {
      sddm.enable = true;
      defaultSession = "none+awesome"; ### standalone
      # defaultSession = "xfce+awesome";
    };

    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks # is the package manager for Lua modules
        # luadbi-mysql # Database abstraction layer <- seeing dep issues :/
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    xorg.xwininfo
  ];
}
