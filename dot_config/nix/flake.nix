{
  description = "Archoo NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.url = "github:LnL7/nix-darwin"; ### macos style nixos-rebuild
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nixos-wsl.url = "github:nix-community/nixos-wsl"; ### wsl compatible nixos
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";
    vscode-server.url = "github:nix-community/nixos-vscode-server"; ### for WSL
    vscode-server.inputs.nixpkgs.follows = "nixpkgs";
    ags.url = "github:Aylur/ags"; ### Aylur's GTK Shell
    ags.inputs.nixpkgs.follows = "nixpkgs";

    dom1153-nix-flake.url = "github:dom1153/nvim-flake";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    nixos-wsl,
    vscode-server,
    ags,
    archoo-nixvim,
    nixos-hardware,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    ### can be formatted using `nix fmt` recursively
    formatter = {
      x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
      aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.alejandra;
    };

    ### NixOS configuration entrypoint
    ### Available through 'nixos-rebuild build --flake .#your-hostname'
    nixosConfigurations = {
      jill-stingray = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./os/jill-stingray];
      };
      alma-armas = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./os/alma-armas];
      };
      sei-asagiri = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./os/sei-asagiri];
      };
      gillian = nixpkgs.lib.nixosSystem {
        ### system must be specified (no hardware-configuration.nix)
        system = "x86_64-linux";
        specialArgs = {inherit inputs outputs;};
        modules = [./os/gillian];
      };
    };

    ### NixOS configuration entrypoint
    ### Available through darwin-rebuild switch --flake .#your-hostname
    darwinConfigurations = {
      stella-hoshii = nix-darwin.lib.darwinSystem {
        ### system must be specified (no hardware-configuration.nix)
        system = "aarch64-darwin";
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./os/stella-hoshii
        ];
      };
      dorothy-haze = nix-darwin.lib.darwinSystem {
        ### system must be specified (no hardware-configuration.nix)
        system = "aarch64-darwin";
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./os/dorothy-haze
        ];
      };
    };

    ### Standalone home-manager configuration entrypoint
    ### Available through 'home-manager --flake .#your-username@your-hostname'
    # homeConfigurations = {
    #   "archoo@jill-stingray" = home-manager.lib.homeManagerConfiguration {
    #     pkgs = nixpkgs.legacyPackages."x86_64-linux";
    #     extraSpecialArgs = {inherit inputs outputs;};
    #     modules = [./home-manager/nixos-home.nix];
    #   };
    #   "archoo@Dominics-MacBook-Pro" = home-manager.lib.homeManagerConfiguration {
    #     pkgs = nixpkgs.legacyPackages.aarch64-darwin;
    #     extraSpecialArgs = {inherit inputs outputs;};
    #     modules = [./home-manager/darwin.nix];
    #   };
    # };
  };
}
