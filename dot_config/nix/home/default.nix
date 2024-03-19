{...}: {
  home = {
    username = "archoo";
  };

  # Let home-manager manage itself when in standalone mode
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
