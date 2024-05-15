{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./nixpkgs.nix
  ];

  # https://discourse.nixos.org/t/nix-flakes-nix-store-source-no-such-file-or-directory/17836/6
  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = ["/etc/nix/path"];

    settings = {
      ### seeing issues on darwin upstream https://github.com/NixOS/nix/issues/7273
      auto-optimise-store = false;
      experimental-features = "nix-command flakes";
    };
  };

  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;
}
