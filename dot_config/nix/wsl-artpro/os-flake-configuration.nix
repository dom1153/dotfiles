{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [];

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
    };
  };

  wsl.enable = true;
  wsl.defaultUser = "archoo";
  wsl.wslConf.network.hostname = "wsl-artpro";

  services.vscode-server.enable = true;

  environment.systemPackages = with pkgs; [
    home-manager
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = false;
    autosuggestions.enable = false;
  };
  users.defaultUserShell = pkgs.zsh;

  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  # time and language locale
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
