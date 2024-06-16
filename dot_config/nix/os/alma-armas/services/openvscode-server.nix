{...}: {
  ### requires manual build... takes a million years
  ### also fails... so unusable atm
  services.openvscode-server = {
    enable = true;
    # port = 3000;
    # host = "alma-armas";
    telemetryLevel = "off";
    userDataDir = "/run/media/archoo/super-4T/appdata/openvscode-server";
  };
  networking = {
    firewall = {
      allowedTCPPorts = [
        3000
      ];
      allowedUDPPorts = [
        3000
      ];
    };
  };
}
