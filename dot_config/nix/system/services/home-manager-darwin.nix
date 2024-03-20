### https://nix-community.github.io/home-manager/nix-darwin-options.xhtml
{inputs, ...}: {
  imports = [
    # inputs.home-manager.darwinModules.home-manager
    inputs.home-manager.darwinModules.default
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs;};

    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
