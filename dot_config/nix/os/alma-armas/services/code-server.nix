{...}: {
  ### requires manual build... takes a million years
  ### also fails... so unusable atm
  ### maybe try specifying package?
  services.code-server = {
    enable = true;
    # host = "alma-armas";
    disableUpdateCheck = true;
    disableWorkspaceTrust = true;
    disableTelemetry = true;
    disableGettingStartedOverride = true;
    userDataDir = "/run/media/archoo/super-4T/appdata/code-server";
  };
  networking = {
    firewall = {
      allowedTCPPorts = [
        4444
      ];
      allowedUDPPorts = [
        4444
      ];
    };
  };
}
