{
  inputs,
  pkgs,
  ...
}: let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;

    config.allowUnfree = true;
  };
in {
  imports = [
    ./gnome-services.nix
    ./greetd.nix
    ./qt.nix
    # ./kwallet.nix ### doesn't fix vscode
    # ./xdg.nix ### does this even help???
  ];

  programs.hyprland = {
    enable = true;
    # package = unstable.hyprland;
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  environment.systemPackages = with pkgs; [
    waybar
    eww
    dunst ### notification daemon
    # mako ### notification daemon (wayland exclusive)
    libnotify ### dependancy for notifier
    mpvpaper
    swww
    wofi
    fuzzel
    wl-clipboard
    networkmanagerapplet
    pavucontrol ### pulse audio volume adjust
    #overskride ### bluetooth gui, alternativly use bluetoothctl
    blueberry ### another bluetooth, has a tray
    hyprshade ### night light
    nwg-bar ### power menu!
  ];

  # Hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
