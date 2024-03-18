{...}: {
  ### works in theory, but probably have to disable default session or something...
  ### at least for plasma...
  services.xrdp = {
    enable = true;
    defaultWindowManager = "startplasma-wayland";
    openFirewall = true;
  };
}
