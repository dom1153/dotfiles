{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ### gui services
    bazecor
    bitwarden
    eww
    kdePackages.krdc
    neovide
    parsec-bin
    qbittorrent

    ### gui tools
    anydesk
    vial
    vlc

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
    signal-desktop
    spotify
    osu-lazer-bin

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
    ripgrep
    starship
    thefuck
    tldr
    tmuxinator
    trash-cli
    wget
    wl-clipboard
    xclip
    xsel
    zoxide

    ### tui apps
    #ponysay
    # neovim
    # vim
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
