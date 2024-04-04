### todo: look at default gnome config from qemu
{pkgs, ...}: {
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
  };

  programs.dconf.enable = true;
  services.dbus.packages = with pkgs; [gnome2.GConf]; ### for ancient apps

  environment.systemPackages = with pkgs; [
    gnome.adwaita-icon-theme ### icons not included by default
    gnomeExtensions.appindicator ### systray icons
    gnome.gnome-settings-daemon ### udev
  ];

  environment.gnome.excludePackages =
    (with pkgs; [
      gnome-photos
      gnome-tour
    ])
    ++ (with pkgs.gnome; [
      cheese # webcam tool
      gnome-music
      gnome-terminal
      # gedit # text editor
      epiphany # web browser
      geary # email reader
      evince # document viewer
      gnome-characters
      totem # video player
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
    ]);

  ### profiling
  # services.sysprof.enable = true;

  ### popular request to improve performance
  ### overlays causing problems again? surprise surprise...
  # nixpkgs.overlays = [
  #   (final: prev: {
  #     gnome = prev.gnome.overrideScope' (gnomeFinal: gnomePrev: {
  #       mutter = gnomePrev.mutter.overrideAttrs (old: {
  #         src = pkgs.fetchgit {
  #           url = "https://gitlab.gnome.org/vanvugt/mutter.git";
  #           # GNOME 45: triple-buffering-v4-45
  #           rev = "0b896518b2028d9c4d6ea44806d093fd33793689";
  #           sha256 = "sha256-mzNy5GPlB2qkI2KEAErJQzO//uo8yO0kPQUwvGDwR4w=";
  #         };
  #       });
  #     });
  #   })
  # ];
  # nixpkgs.config.allowAliases = false; ### performance enhancement depends on this
}
