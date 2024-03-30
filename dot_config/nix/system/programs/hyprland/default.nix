{pkgs, ...}: {
  ### these dependancies are being configured for just hyprland, not in general
  ### otherwise I would move them to the services folder
  imports = [
    # ./gdm.nix ### does not work well with plymouth boot ; gdm starts after hyprland logs in???
    # ./gnome-services.nix
    ./greetd.nix
    # ./kwallet.nix
    ./xdg.nix
  ];

  ### optional dependancies:
  ###   kwallet.nix - keyring (e.g. vscode)
  ###   gdm.nix - autologin / autostart
  ###   xdg.nix - portals
  ###   gtk.nix / qt.nix (via home-manager)
  programs.hyprland = {
    enable = true;
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
    overskride ### bluetooth gui, alternativly use bluetoothctl
    blueberry ### another bluetooth, has a tray
    hyprshade ### night light
  ];

  # Hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
