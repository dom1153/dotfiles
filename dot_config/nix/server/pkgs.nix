{ config, pkgs, ... }:

{
  ### allow unfree packages (steam etc)
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
  ];
}
