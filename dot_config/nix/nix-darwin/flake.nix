{
  description = "Archoo's NixOS / nix-darwin configuration";

  inputs = {
    ### core inputs
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  
  outputs = inputs@{ nixpkgs, home-manager, nix-darwin, ... }: {
    darwinConfigurations = {
      ### darwin-rebuild switch --flake .
      Dominics-MacBook-Pro = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./configuration.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          #   home-manager.users.jdoe = import ./home.nix;

          #   # Optionally, use home-manager.extraSpecialArgs to pass
          #   # arguments to home.nix
          }
        ];
      };
    };
  };
}
