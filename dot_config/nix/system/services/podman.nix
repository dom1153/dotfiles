{
  inputs,
  pkgs,
  ...
}: let
  stable = import inputs.nixpkgs-stable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in {
  # Enable common container config files in /etc/containers
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      package = stable.podman;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # ### start podman.socket for
  # systemd.sockets.podman = {
  #   enable = true;
  #   wantedBy = ["sockets.target"];
  # };

  ### systemctl --user start podman.socket
  systemd.user.services.podman-socket = {
    enable = true;
    wantedBy = ["default.target"]; # Ensures it starts on user login
  };

  # Useful other development tools
  environment.systemPackages = with pkgs; [
    stable.dive # look into docker image layers
    # stable.podman-tui # status of containers in the terminal ### doesn't connect to socket???
    stable.podman-compose # start group of containers for dev
  ];
}
