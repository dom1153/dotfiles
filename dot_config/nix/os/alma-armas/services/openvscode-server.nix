{inputs, ...}: let
  unstable = import inputs.nixpkgs-unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
in {
  ### requires manual build... takes a million years
  ### also fails... so unusable atm
  services.openvscode-server = {
    enable = true;
    port = 8080;
    # host = "alma-armas";
    package = unstable.openvscode-server;
    telemetryLevel = "off";
    userDataDir = "/run/media/archoo/super-4T/appdata/openvscode-server";
  };
  networking = {
    firewall = {
      allowedTCPPorts = [
        8080
      ];
      allowedUDPPorts = [
        8080
      ];
    };
  };
}
