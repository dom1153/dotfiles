{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ### gui services
    # bazecor ### seems to be bugged
    eww
    font-manager
    localsend
    neovide
    qbittorrent
    # gnome.gnome-font-viewer ### too many chefs
    # kdePackages.krdc
    parsec-bin
    # bitwarden ### always seems to be logged out...

    ### gui tools
    vial
    mpv
    # anydesk
    # vlc

    ### gui terminal emulators
    alacritty
    foot

    ### gui art
    drawpile
    blender
    kolourpaint ### windows 98 style
    pureref
    # krita

    ### gui development
    vscode
    # geany ### plasma kate exists

    ### gui apps
    discord
    microsoft-edge
    firefox
    obsidian
    osu-lazer-bin
    signal-desktop
    spotify
    # brave

    ### cli tools and services
    alejandra
    bat
    cheat
    chezmoi
    entr
    eza
    fzf
    gh
    mosh
    qemu
    quickemu
    quickgui
    ripgrep
    starship
    thefuck
    tldr
    tmuxinator
    trash-cli
    watchman ### for chezmoi
    wayland-utils ### wayland-info and more (useful for plasma)
    wget
    wl-clipboard
    xclip
    zoxide
    # qmk ### try flake inside qmk repo
    # xsel ### already have xclip right?
    # speedtest-lci
    # imagemagick
    # fortune

    ### tui apps
    ani-cli
    btop
    diff-so-fancy
    lazygit
    mc
    ncdu
    neofetch
    nitch
    ranger
    tmux
    ttyper
    zellij
    # htop
    # fastfetch
    # neovim
    # ponysay
    # taskell
    # vim
    # nmon
    # vtop

    ### zsh
    zsh-autocomplete
    nix-zsh-completions
    zsh-nix-shell

    ### neovim (plugin dependencies)
    # cargo
    # curl
    # fd
    # gnumake
    # llvmPackages_9.libcxxClang
    # nodejs_21
    # rustc
    # rustfmt
    # stylua
    # tree-sitter
    # unzip
    # shfmt

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
  ];
}
