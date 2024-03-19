{inputs, ...}: {
  imports = [
    inputs.home-manager.darwinModules.default
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs;};

    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
