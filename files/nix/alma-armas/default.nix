{ ... }: {
  imports = [
    ./core.nix
    ./cli.nix
    ./desktop.nix
    # ./disks.nix
    ./services.nix

    ./hardware-configuration.nix
  ];

  system.stateVersion = "24.11"; # leave this alone
}
