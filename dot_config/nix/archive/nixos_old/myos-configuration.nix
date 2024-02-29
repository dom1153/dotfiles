### add a line in /etc/nixos/configuration.nix
### imports = [ /home/$USER/nix/myos-configuration.nix ];
### suggested command (in /tmp) nixos-rebuild [test|switch|dry-activate]

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./plasma.nix
      #./hyprland.nix
      ./pkgs.nix
      #<home-manager/nixos> ### requires channel to be added, consider flake
    ];

  ### updated nix-channels and now this is complaining... guess we need to learn flakes
  nixpkgs.config.permittedInsecurePackages = [
    #"electron-25.9.0" ### for obsidian
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  ### let clock work with windows
  time.hardwareClockInLocalTime = true;

  boot.supportedFilesystems = [ "ntfs" ];
  ### mount data drive. nofail should make this not bork the system if it's missing
  ### type ntfs3 stopped working at some point??? use regular ntfs
  fileSystems."/run/media/archoo/DomData" =
  { 
    device = "/dev/sda2";
    fsType = "ntfs";
    options = [
      "nofail"
    ];
  };

  services.xserver.videoDrivers = [ "amdgpu" ];

  boot.loader.systemd-boot.configurationLimit = 5;

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  ### enable 8bitdo ultimate controller support
  services.udev.extraRules = ''
    ACTION=="add", \
      ATTRS{idVendor}=="2dc8", \
      ATTRS{idProduct}=="3106", \
      RUN+="${pkgs.kmod}/bin/modprobe xpad", \
      RUN+="${pkgs.bash}/bin/sh -c 'echo 2dc8 3106 > /sys/bus/usb/drivers/xpad/new_id'"
  '';

  networking.hostName = "artpro"; # Define your hostname.

  programs.zsh = {
    enable = true;
    enableCompletion = true; ### not to be confused with autocomplete
    autosuggestions.enable = true;
    zsh-autoenv.enable = true;
    #syntaxHighlighting.enable = true;
  };
  users.users.archoo.shell = pkgs.zsh;

  ### home manager
  #users.users.archoo.isNormalUser = true;
  #home-manager.users.archoo = { pkgs, ...}: {
    #home.packages = with pkgs; [ atool httpie home-manager ];
    ##programs.home-manager.enable = true;
    #programs.zsh = {
      #enable = true;
    #};
    #home.stateVersion = "23.11";
  #};
}
