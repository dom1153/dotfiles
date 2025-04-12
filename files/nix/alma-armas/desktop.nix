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

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  fonts.packages = with pkgs; [
    cozette
    dina-font
    monaspace
    (nerdfonts.override {fonts = ["FiraCode" "CascadiaCode"];})
  ];

  programs = {
    firefox.enable = true;
  };

  environment.systemPackages = with pkgs; [
    ptyxis
    gparted
    gnome-remote-desktop
  ];

  #? NixOS wiki: https://nixos.wiki/wiki/Flatpak
  #? Flathub: https://flatpak.org/setup/NixOS
  services.flatpak.enable = true;

  users.users.archoo = {
    isNormalUser = true;
    description = "archoo";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      flatpak
      gnome-software
      boxbuddy
    ];
  };
}
