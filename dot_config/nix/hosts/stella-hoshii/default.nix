### TODO: homebrew should be manually installed
{inputs, ...}: {
  imports = [
    inputs.home-manager.nixosModules.default

    ../../system/nix

    ../../system/programs/zsh.nix

    ../../system/services/home-manager.nix
  ];

  ### Builds home-manager with nixos-rebuild
  home-manager.users."archoo" = import ../../home/profiles/alma-armas;

  ### TODO: does this work?
  networking.hostName = "stella-hoshii";

  ### Auto upgrade nix package and the daemon service.
  # services.nix-daemon.enable = true;

  ### without this it may try to reconfigure nix as x86_64-darwin
  nixpkgs.hostPlatform = "aarch64-darwin";

  ### Used for backwards compatibility, please read the changelog before changing.
  ### $ darwin-rebuild changelog
  system.stateVersion = 4;
}
