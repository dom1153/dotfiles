{inputs, ...}: {
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  ### systemctl -l status home-manager-archoo.service --lines 200
  home-manager = {
    ### extra specialArgs passed to Home Manager
    ### for reference, the config argument in nixos can be accessed
    ### in home-manager through osConfig without us passing it
    extraSpecialArgs = {inherit inputs;};

    ### tell home-manager to be as verbose as possible
    # verbose = true;

    ### use the system configuration’s pkgs argument
    ### this ensures parity between nixos' pkgs and hm's pkgs
    useGlobalPkgs = true;

    ### enable the usage user packages through
    ### the users.users.<name>.packages option
    useUserPackages = true;

    # move existing files to the .old suffix rather than failing
    # with a very long error message about it
    backupFileExtension = "old";
  };
}
