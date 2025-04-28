{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  fonts.packages = with pkgs; [
    cozette
    dina-font
    monaspace
    nerdfonts
  ];

  programs = {
    firefox.enable = true;
  };

  environment.systemPackages = with pkgs; [
    ptyxis
    gparted
  ];

  #? NixOS wiki: https://nixos.wiki/wiki/Flatpak
  #? Flathub: https://flatpak.org/setup/NixOS
  services.flatpak.enable = true;

  users.users."user" = {
    packages = with pkgs; [
      flatpak
      gnome.gnome-software
    ];
  };
}
