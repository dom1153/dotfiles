{inputs, ...}: {
  imports = [
    inputs.home-manager.nixosModules.default
    inputs.nixos-wsl.nixosModules.default

    ../../system/core/wsl.nix
    ../../system/core/locale.nix
    ../../system/core/users.nix

    #../../system/hardware/bluetooth.nix

    ../../system/nix

    ../../system/programs/zsh.nix
    ../../system/programs/fish.nix

    #../../system/services/avahi.nix
    ../../system/services/home-manager.nix
    ### We'll leave this here, but it seems can't ssh out of the box
    #../../system/services/openssh.nix
    #../../system/services/syncthing.nix
  ];

  ### Builds home-manager with nixos-rebuild
  home-manager.users."archoo" = import ../../home/profiles/gillian;

  wsl.wslConf.network.hostname = "gillian";

  services.syncthing = {
    dataDir = "/home/archoo/Documents"; # Default folder for new synced folders
    configDir = "/home/archoo/Documents/.config/syncthing"; # Folder for Syncthing's settings and keys
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
