{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ### gui services
    bazecor
    # bitwarden ### always seems to be logged out...
    eww
    kdePackages.krdc
    localsend
    neovide
    parsec-bin
    qbittorrent
    quickemu

    ### gui tools
    anydesk
    vial
    # vlc
    mpv

    ### gui terminal emulators
    alacritty
    foot

    ### gui art
    krita
    pureref

    ### gui development
    geany ### plasma kate exists
    vscode

    ### gui apps
    brave
    discord
    microsoft-edge
    obsidian
    osu-lazer-bin
    signal-desktop
    spotify

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
    qmk
    quickemu
    quickgui
    ripgrep
    starship
    thefuck
    tldr
    tmuxinator
    trash-cli
    watchman
    wget
    wl-clipboard
    xclip
    xsel
    zoxide
    # speedtest-lci
    # imagemagick

    ### tui apps
    ani-cli
    diff-so-fancy
    fastfetch
    lazygit
    mc
    ncdu
    neofetch
    nitch
    ranger
    tmux
    ttyper
    zellij
    # neovim
    # ponysay
    # taskell
    # vim

    ### zsh
    zsh-autocomplete
    nix-zsh-completions
    zsh-nix-shell

    ### neovim (plugin dependencies)
    cargo
    curl
    fd
    gnumake
    llvmPackages_9.libcxxClang
    nodejs_21
    rustc
    rustfmt
    stylua
    tree-sitter
    unzip
    shfmt

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
