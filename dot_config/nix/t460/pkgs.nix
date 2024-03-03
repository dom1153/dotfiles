{ config, pkgs, ... }:

{
  ### allow unfree packages (steam etc)
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
  ];

  fonts.packages = with pkgs; [
    #cozette
    dina-font
    monaspace
    (nerdfonts.override { fonts = [ "FiraCode" "CascadiaCode" ]; })
  ];

  ### steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  ### fix udev rules for qmk
  hardware.keyboard.qmk.enable = true;
}
