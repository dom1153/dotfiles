### https://nix-community.github.io/home-manager/nix-darwin-options.xhtml
{inputs, ...}: {
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs;};

    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "old";
  };
}
