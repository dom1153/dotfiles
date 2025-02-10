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

  home-manager.users.archoo = import ../../home/profiles/stella-hoshii;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  users.users.archoo = {
    name = "archoo";
    home = "/Users/archoo";
  };

  # Works via 'launchd' https://launchd.info/
  # Startup files to go into ~/Library/LaunchAgents
  environment.userLaunchAgents = {
    # Calls 'open -n /Applications/Steam.app/ --args -silent'
    # May not work as I want because on boot wifi is not always availble on startup (e.g. coffee shops)
    steam = {
      enable = false;
      source = ./launchd/steam-silent.plist;
      target = "com.valvesoftware.steam.plist";
    };
    ### yabai and skhd should be installed via 'brew install' (without 'brew service')
    # yabai = {
    #   enable = true;
    #   source = ./launchd/yabai.plist;
    #   target = "com.koekeishiya.yabai.plist";
    # };
    # skhd = {
    #   enable = true;
    #   source = ./launchd/skhd.plist;
    #   target = "com.koekeishiya.skhd.plist";
    # };
  };

  # nixpkgs.config.allowUnfree = true;

  networking.hostName = "stella-hoshii";

  ### Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  ### without this it may try to reconfigure nix as x86_64-darwin
  nixpkgs.hostPlatform = "aarch64-darwin";

  ### Used for backwards compatibility, please read the changelog before changing.
  ### $ darwin-rebuild changelog
  system.stateVersion = 4;
}
