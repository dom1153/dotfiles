{ config, pkgs, ... }:

{
  ### allow unfree packages (steam etc)
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
  ];

  # environment.systemPackages = with pkgs; [
  #   ### gui services
  #   bazecor
  #   qbittorrent
  #   bitwarden
  #   eww-wayland

  #   ### gui tools
  #   anydesk
  #   vial
  #   vlc

  #   ### gui terminal emulators
  #   alacritty
  #   foot

  #   ### gui art
  #   krita
  #   pureref		### fixed with custom appimage

  #   ### gui development
  #   geany		### plasma kate exists
  #   vscode

  #   ### gui apps
  #   brave
  #   discord
  #   microsoft-edge
  #   # obsidian
  #   signal-desktop
  #   spotify
  #   osu-lazer-bin

  #   ### cli tools and services
  #   cheat
  #   chezmoi
  #   curlWithGnuTls
  #   gh
  #   # git
  #   qemu
  #   qmk
  #   starship
  #   tldr
  #   tmuxinator
  #   trash-cli
  #   wget
  #   wl-clipboard	### hyprland
  #   xclip
  #   xsel
  #   home-manager

  #   ### tui apps
  #   #ponysay
  #   ncdu    ### ncurses du (disk management)
  #   ani-cli
  #   fastfetch
  #   mc
  #   neofetch
  #   neovim
  #   ranger
  #   tmux
  #   zellij
  #   ttyper
  #   vim
  #   nitch

  #   ### cli development
  #   #python3
  #   #llvmPackages_9.libcxxClang	### for qmk , and probably more

  #   ### other
  #   wayland-utils          ### wayland-info and more

  #   ### Hyprland 'must have'
  #   kitty
  #   dunst
  #   mako
  #   pipewire
  #   wireplumber
  #   qt6.qtwayland
  #   ### optionally
  #   wofi
  #   hyprpaper
  #   waybar
  # ];

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
