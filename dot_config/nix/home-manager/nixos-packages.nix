{pkgs, ...}: {
  home.packages = with pkgs; [
    ### gui services
    # bazecor ### seems to be bugged
    eww
    font-manager
    localsend
    neovide
    qbittorrent
    parsec-bin

    ### gui tools
    vial
    mpv

    ### gui terminal emulators
    kitty
    foot

    ### gui art
    drawpile
    blender
    kolourpaint ### windows 98 style
    pureref
    # krita

    ### gui development
    vscode

    ### gui apps
    discord
    microsoft-edge
    firefox
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
    fd
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

    ### zsh
    zsh-autocomplete
    nix-zsh-completions
    zsh-nix-shell
  ];
}
