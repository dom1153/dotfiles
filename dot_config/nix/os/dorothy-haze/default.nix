### TODO: homebrew should be manually installed
### nix-darwin docs: https://daiderd.com/nix-darwin/manual/index.html
{inputs, ...}: {
  imports = [
    inputs.home-manager.darwinModule

    ../../system/nix

    ../../system/programs/zsh.nix
    ../../system/programs/fish.nix

    ../../system/services/home-manager-darwin.nix
    ../../system/services/brew.nix
  ];

  home-manager.users.archoo = import ../../home/profiles/dorothy-haze;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  users.users.archoo = {
    name = "archoo";
    home = "/Users/archoo";
  };

  environment.userLaunchAgents = {
    # Calls 'open -n /Applications/Steam.app/ --args -silent'
    # steam = {
    #   enable = true;
    #   source = ./launchd/steam-silent.plist;
    #   target = "com.valvesoftware.steam.plist";
    # };
  };

  # nixpkgs.config.allowUnfree = true;

  ### Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  ### without this it may try to reconfigure nix as x86_64-darwin
  nixpkgs.hostPlatform = "aarch64-darwin";

  ### Used for backwards compatibility, please read the changelog before changing.
  ### $ darwin-rebuild changelog
  system.stateVersion = 4;
}
