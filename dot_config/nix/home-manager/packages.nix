{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ### gui services
    bazecor
    qbittorrent
    bitwarden
    eww-wayland

    ### gui tools
    anydesk
    vial
    vlc

    ### gui terminal emulators
    alacritty
    foot

    ### gui art
    krita
    pureref ### fixed with custom appimage

    ### gui development
    geany ### plasma kate exists
    vscode

    ### gui apps
    brave
    discord
    microsoft-edge
    # obsidian
    signal-desktop
    spotify
    osu-lazer-bin

    ### cli tools and services
    bat
    cheat
    chezmoi
    curlWithGnuTls
    eza
    gh
    # git
    ripgrep
    qemu
    entr
    qmk
    fzf
    starship
    tldr
    tmuxinator
    trash-cli
    wget
    wl-clipboard ### hyprland
    xclip
    xsel
    zoxide
    # home-manager

    ### tui apps
    #ponysay
    ncdu ### ncurses du (disk management)
    ani-cli
    fastfetch
    mc
    neofetch
    neovim
    ranger
    tmux
    zellij
    ttyper
    vim
    nitch

    ### cli development
    #python3
    #llvmPackages_9.libcxxClang	### for qmk , and probably more

    ### other
    wayland-utils ### wayland-info and more

    ### Hyprland 'must have'
    kitty
    # dunst
    # mako
    # pipewire
    # wireplumber
    # qt6.qtwayland
    ### optionally
    # wofi
    # hyprpaper
    # waybar

    # ponysay htop fortune
  ];
}
