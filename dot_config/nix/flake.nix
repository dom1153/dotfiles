{
  description = "Archoo NixOS Config";

  inputs = {
    ### try unstable
    nixpkgs.url = "github:NixOS/nixpkgs?rev=2726f127c15a4cc9810843b96cad73c7eb39e443";
    ### 23.11 ; lock version with a hash; works ok but having issues with nvim-flake
    # nixpkgs.url = "github:NixOS/nixpkgs?rev=0638fe2715d998fa81d173aad264eb671ce2ebc1"; ### https://github.com/NixOS/nixpkgs/commit/0638fe2715d998fa81d173aad264eb671ce2ebc1
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    #home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.url = "github:LnL7/nix-darwin"; ### macos support
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nixos-wsl.url = "github:nix-community/nixos-wsl"; ### wsl nixos support
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";
    vscode-server.url = "github:nix-community/nixos-vscode-server"; ### for WSL
    vscode-server.inputs.nixpkgs.follows = "nixpkgs";
    ags.url = "github:Aylur/ags"; ### Aylur's GTK Shell
    ags.inputs.nixpkgs.follows = "nixpkgs-unstable";

    # hyprland.url = "github:hyprwm/Hyprland";

    dom1153-nvim-flake.url = "github:dom1153/nvim-flake";
    # dom1153-nvim-flake.inputs.nixpkgs.follows = "nixpkgs-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nixpkgs-stable,
    home-manager,
    nix-darwin,
    nixos-wsl,
    vscode-server,
    ags,
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
        system = "x86_64-linux";
        specialArgs = {inherit inputs outputs;};
        modules = [
          # ./os/jill-stingray/services/containers.nix
          ./os/jill-stingray
        ];
      };
      alma-armas = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs outputs;};
        modules = [./os/alma-armas];
      };
      sei-asagiri = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
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
