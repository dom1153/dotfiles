{
  description = "Archoo NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs-unstable";
    nixos-wsl.url = "github:nix-community/nixos-wsl";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs-unstable";
    vscode-server.url = "github:nix-community/nixos-vscode-server";
    vscode-server.inputs.nixpkgs.follows = "nixpkgs-unstable";
    # hardware.url = "github:nixos/nixos-hardware";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    nixvim,
    nixos-wsl,
    vscode-server,
    ...
  } @ inputs: let
    inherit (self) outputs;
    # system = "x86_64-linux"; # for homeConfigurations; if used
  in {
    ### NixOS configuration entrypoint
    ### Available through 'nixos-rebuild build --flake .#your-hostname'
    nixosConfigurations = {
      jill-stingray = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./hosts/jill-stingray];
      };
      alma-armas = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./hosts/alma-armas];
      };
      # wsl-artpro = nixpkgs.lib.nixosSystem {
      #   system = "x86_64-linux";
      #   specialArgs = {inherit inputs outputs;};
      #   modules = [
      #     ./wsl-artpro/os-flake-configuration.nix
      #     vscode-server.nixosModules.default
      #     nixos-wsl.nixosModules.default
      #   ];
      # };
      # t460 = nixpkgs.lib.nixosSystem {
      #   specialArgs = {inherit inputs outputs;};
      #   modules = [./t460/os-flake-configuration.nix];
      # };
    };

    ### NixOS configuration entrypoint
    ### Available through darwin-rebuild switch --flake .#your-hostname
    darwinConfigurations = {
      stella-hoshii = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = {inherit inputs outputs;};
        modules = [./host/stella-hoshii.nix];
      };
    };

    ### Standalone home-manager configuration entrypoint
    ### Available through 'home-manager --flake .#your-username@your-hostname'
    # homeConfigurations = {
    # "archoo@jill-stingray" = home-manager.lib.homeManagerConfiguration {
    #   pkgs = nixpkgs.legacyPackages.${system};
    #   extraSpecialArgs = {inherit inputs outputs;};
    #   modules = [
    #     ./home-manager/nixos-home.nix
    #   ];
    # };
    #   "archoo@Dominics-MacBook-Pro" = home-manager.lib.homeManagerConfiguration {
    #     pkgs = nixpkgs.legacyPackages.aarch64-darwin;
    #     extraSpecialArgs = {inherit inputs outputs;};
    #     modules = [
    #       ./home-manager/darwin.nix
    #       nixvim.homeManagerModules.nixvim
    #     ];
    #   };
    #   "archoo@archoo-server" = home-manager.lib.homeManagerConfiguration {
    #     pkgs = nixpkgs.legacyPackages.x86_64-linux;
    #     extraSpecialArgs = {inherit inputs outputs;};
    #     modules = [
    #       ./home-manager/server-home.nix
    #       nixvim.homeManagerModules.nixvim
    #     ];
    #   };
    #   "archoo@wsl-artpro" = home-manager.lib.homeManagerConfiguration {
    #     pkgs = nixpkgs.legacyPackages.x86_64-linux;
    #     extraSpecialArgs = {inherit inputs outputs;};
    #     modules = [
    #       ./home-manager/wsl-artpro-home.nix
    #       nixvim.homeManagerModules.nixvim
    #     ];
    #   };
    #   "archoo@t460" = home-manager.lib.homeManagerConfiguration {
    #     pkgs = nixpkgs.legacyPackages.x86_64-linux;
    #     extraSpecialArgs = {inherit inputs outputs;};
    #     modules = [
    #       ./home-manager/t460-home.nix
    #       nixvim.homeManagerModules.nixvim
    #     ];
    #   };
    # };
  };
}
