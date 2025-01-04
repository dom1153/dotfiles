{
  inputs,
  pkgs,
  ...
}: let
  stable = import inputs.nixpkgs-stable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
  unstable = import inputs.nixpkgs-unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
in {
  home.packages = with pkgs; [
    ### services
    # unstable.localsend ### conflicts with rustdesk
    unstable.parsec-bin
    unstable.rustdesk-flutter
    eww
    xdragon ### drag and drop files (x server)

    ### tools
    unstable.spotify
    neovide
    vial
    mpv
    imv ### image viewer
    feh ### image previewer
    losslesscut-bin
    meld ### folder comparison ; can't find preferences folder qq
    stable.postman ### REST
    unstable.code-cursor ### ai powered ide
    unstable.zed-editor

    ### art
    stable.blockbench ### voxel 3d modeling
    libsForQt5.kolourpaint ### windows 98 style

    ### terminal emulators
    unstable.kitty
    unstable.foot
    cool-retro-term
    stable.wezterm ### not working well with hyprland wayland (x11 works) ; use for other platforms
    unstable.ghostty

    ### apps
    discord
    microsoft-edge
    firefox
    unstable.obsidian
    unstable.osu-lazer-bin
    unstable.anki-bin
    google-chrome

    gnome.gnome-disk-utility

    unstable.appimage-run ### the main workaround for appimages /shrug

    unstable.godot_4

    cura ### ultimaker cura ; 3d slicer
    prusa-slicer ### open source 3d slicer

    stable.rofi ### window switcher
    stable.qalculate-qt ### calculator

    ### cli (linux only)
    ### unix alternative
    unstable.devcontainer ### run devcontainer from cli -> macos should use brew
    stable.bat
    stable.btop
    stable.delta ### git diff specifically
    stable.diff-so-fancy
    stable.eza
    stable.fd
    stable.file ### get... file types e.g. mime; use with lf preview
    stable.fzf
    stable.glow ### fancy md file reading
    stable.grc ### generic colorizer ; aliases colorize common unix commands
    stable.micro ### nano alternative
    stable.ripgrep
    stable.rsync ### pre-installed on nix and darwin, but let's keep it consistent
    stable.tailspin ### tail but its got colors (tspin)
    stable.unzip
    stable.zip
    stable.zoxide

    ### tools
    stable.asciinema
    stable.chezmoi
    stable.spacer ### append lines after a given time in tail
    stable.fast-cli ### does not work on darwin
    stable.speedtest-cli
    stable.wget
    stable.chafa ### sixel (lf)
    stable.timg ### image viewer fallback when sixel doesn't work
    stable.trurl ### transpose url (get url parts)
    stable.imagemagick ### convert images (e.g. use with kitty icat)
    stable.lsix ### ls, but for sixel (it's just a shell script)
    stable.jq ### parse / query json
    stable.dasel ### yq but different
    stable.yq-go ### jq but for xml,cvs,toml too (prefer go > python version)
    # direnv ### auto load env (nix shell, devenv)
    stable.vhs ### tool to create terminal gifs with code
    stable.t-rec ### geenrate animated gifs for the web (rust)
    stable.xdg-ninja ### check $HOME for unwanted files/directories and move them
    stable.fpp ### facebook pathpicker (edit or run commands on path of ouptut)
    stable.gitmoji-cli ### emoji based commit (simple?)
    stable.tree ### generate a ls tree
    stable.duf ### df alternative
    stable.sd ### sed alternative
    stable.procs ### ps alternative
    stable.curlie ### curl alternative
    stable.dust ### du alternative
    stable.just ### command line runner (like make)
    stable.watchexec ### generic watch command

    ### funni
    stable.lolcat # keeping this for legacy (lf) reasons ; can remove eventually
    stable.ponysay
    stable.fortune
    stable.cmatrix
    stable.cbonsai
    stable.figlet ### making large letters out of ordinary letters
    stable.sl ### steam locomotive for when you mistype ls
    stable.fastfetch

    ### services
    stable.entr
    stable.mosh
    stable.starship
    stable.watchman ### for chezmoi

    ### cheatsheets
    stable.cheat
    stable.tealdeer ### rust version compliant with  tldr client
    # tldr

    ### development
    stable.shfmt ### unsure how to integrate
    stable.gum ### shell bubbletea

    ### tui
    stable.helix
    stable.lazygit
    stable.lf
    stable.mc
    stable.nap ### snippet manager
    stable.navi
    stable.ncdu
    tmux
    stable.yazi ### another lf ; batteries included
    stable.zellij
  ];

  # (with pkgs; [
  #   # list of stable packages go here
  # ])
  #
  # ++
  #
  # (with pkgs-unstable; [
  #   # list of unstable packages go here
  # ]);
}
