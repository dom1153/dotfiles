{...}: {
  ### manages homebrew, homebrew itself must be installed manually!
  homebrew = {
    enable = true;
    brews = [
      "ghcup" ### haskell ghc manager

      "bat"
      "btop"
      "git-delta"
      "diff-so-fancy"
      "eza"
      "fd"
      "fzf"
      "glow"
      "grc"
      "micro"
      "ripgrep"
      "tailspin"
      "unzip"
      "zip"
      "zoxide"
      "rsync"
      "file-formula"

      ### tools
      "asciinema"
      "spacer"

      "chezmoi"
      "speedtest-cli"
      "wget"
      "chafa"
      "timg"
      "trurl"
      "imagemagick"
      "lsix"
      "yq"
      "jq"
      "dasel"
      "vhs"
      "t-rec"
      "xdg-ninja"
      "fpp"
      "gitmoji"
      "tree"
      "duf"
      "sd"
      "procs"
      "curlie"
      "dust"
      "just"
      "watchexec"
      ### funni
      "lolcat"
      "ponysay"
      "fortune"
      "cmatrix"
      "cbonsai"
      "figlet"
      "sl"
      "fastfetch"
      ### services
      "entr"
      "mosh"
      "starship"
      "watchman"
      ### cheatsheets
      "cheat"
      "tealdeer"
      ### development
      "shfmt" ### unsure how to integrate
      "gum" ### shell bubbletea
      unstable.rnr ### batch file rename

      ### tui
      "helix"
      "lazygit"
      "lf"
      "mc"
      "nap"
      "navi"
      "ncdu"
      "tmux"
      "yazi"
      "zellij"

      ### brews
      "cava" ### cross-platform audio visualizer ### does not work out of the box on osx https://github.com/karlstav/cava/issues/478
      "tty-clock"
    ]; ### likely use nixpkgs instead
    casks = [
      ### experimental / extra
      "amethyst" ### yabai superior, even without SIP
      "alacritty"
      "alfred"
      "anydesk"
      "bartender"
      "blender"
      "codux"
      "duckduckgo"
      "firefox"
      "karabiner-elements"
      "logseq"
      "openvpn-connect"
      "playcover-nightly" ### community version not good enough at 3.0.0
      "processing"
      "runelite"
      "runjs"
      "shortcat" ### macos keyboard navigation concept
      "tabby"
      "vivaldi"
      "vlc"
      "mos" ### mouse wheel
      "warp"
      "zed"
      "proton-mail" ### just a web app
      "knime" ### Software to create and productionise data science
      "sigmaos" ###
      "tyke" ### deprecated

      ### casks
      "postman" ### rest api tester
      "cursor" ### AI ide
      "jetbrains-toolbox" ### jetbrain program install manager
      "ultimaker-cura" ### 3d slicer
      "prusaslicer" ### open source 3d slicer
      ### "xnviewmp" ### xn viewer mpv -> looks ugly...
      "background-music"
      "epic-games"
      "unity-hub"
      "hhkb"
      "gamemaker"
      "firefox-developer-edition" ### keeps wanting to fresh install??? I use chrome devtools anyways
      "logi-options-plus" ### seems to update too much
      "aerospace" ### doesn't play well with macos spaces, keyboard centric
    ];
    taps = [
      "PlayCover/playcover"

      "nikitabobko/tap" ### aerospace
      "osx-cross/arm"
    ];

    ### excluded due to not existing on homebrew or on appstore
    # Aesprite
    # Authy
    # BetterSnapTool
    # CompareMerge2
    # Google Chrome Developer Edition
    # IntelliJ IDEA CE
    # Pixea
    # Proton Mail Bridge
    # Sidekick (browser)
    # Shirabe Jisho
    # Synergy
    # hour blocks : day planner
    # commandone - file manager
    # wireguard ### use appstore
    # "bitwarden"  ### don't use brew or appstore ; had issues powering off pc due to processing not quitting; biometric unlock is buggy via browser extension; auto login / menu bar is buggy sometimes
    # "windscribe" ### does not seem to add gui, maybe only the vpn aspect
  };
}
