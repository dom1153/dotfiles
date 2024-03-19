### TODO: homebrew should be manually installed
{inputs, ...}: {
  imports = [
    inputs.home-manager.darwinModule

    ../../system/nix

    ../../system/programs/zsh.nix

    ../../system/services/home-manager-darwin.nix
  ];

  home-manager.users.archoo = import ../../home/profiles/stella-hoshii;

  users.users.archoo = {
    name = "archoo";
    home = "/Users/archoo";
  };

  ### Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  ### without this it may try to reconfigure nix as x86_64-darwin
  nixpkgs.hostPlatform = "aarch64-darwin";

  ### Used for backwards compatibility, please read the changelog before changing.
  ### $ darwin-rebuild changelog
  system.stateVersion = 4;
}
