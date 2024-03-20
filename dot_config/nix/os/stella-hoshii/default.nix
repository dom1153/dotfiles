### TODO: homebrew should be manually installed
### nix-darwin docs: https://daiderd.com/nix-darwin/manual/index.html
{inputs, ...}: {
  imports = [
    inputs.home-manager.darwinModule

    ../../system/programs/zsh.nix

    # ../../system/services/home-manager-darwin.nix
    ../../system/services/brew.nix
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs;};

    useGlobalPkgs = true;
    useUserPackages = true;
    users.archoo = import ../../home/profiles/stella-hoshii;
  };

  # Optionally, use home-manager.extraSpecialArgs to pass
  # arguments to home.nix

  # home-manager.users.archoo = import ../../home/profiles/stella-hoshii;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  nixpkgs.config.allowUnfree = true;

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
