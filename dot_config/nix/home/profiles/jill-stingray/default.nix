{
  inputs,
  pkgs,
  ...
}: let
  unstable = import inputs.nixpkgs-unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };

  zen-browser = pkgs.callPackage ../../programs/pkgs/zen-browser.nix {};
in {
  imports = [
    ../../../home

    ../../programs
    # ../../programs/hyprland
    # ../../programs/mime.nix ### disable with plasma /shrug
    ../../programs/vscode.nix
    # ../../programs/gnome.nix
    # ../../programs/barrier.nix

    ../../terminal/programs
    ../../terminal/programs/qemu.nix

    ../../terminal/shell/zsh.nix
    ../../terminal/shell/fish.nix
    ../../terminal/shell/nushell.nix

    ../../terminal/programs/vim.nix
    ../../terminal/programs/tmux.nix

    ### awesomewm
    # ../../programs/wm/qt.nix
    # ../../programs/wm/gtk.nix
  ];

  home = {
    homeDirectory = "/home/archoo";

    sessionVariables = {
      ### https://github.com/USA-RedDragon/jagex-launcher-flatpak
      ### add flatpak bin paths (runescape)
      XDG_DATA_DIRS = "$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";

      EDITOR = "nvim";
    };

    packages = with pkgs; [
      zen-browser

      ### gui services
      bazecor ### seems to be bugged
      font-manager
      qbittorrent

      ### gui art
      drawpile
      blender
      pureref ### only works on this system :)
      # krita

      ### gui apps
      unstable.signal-desktop ### limited ot 5 devices
      ### can't revert this due to sql db having issues

      ### cli tools and services
      thefuck
      trash-cli

      ### tui
      nitch
      ranger
      ttyper

      nix-prefetch-github ### for the dumb nixos stuff
      gnumake

      barrier ### synergy

      nvim-pkg # my custom nvim

      python312Packages.pywatchman ### watchman-make

      # itch ### broken

      drawing ### ms paint, but gnome
      krita ### drawing
      pinta ### like paint dot net
      ctpv ### simple terminal preview (but in c)

      cava ### cross-platform audio visualizer

      jnv ### interactive jq

      unstable.vesktop ### better discord
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };

  programs = {
    autorandr = {
      enable = true;
      profiles = {
        "dual" = {
          fingerprint = {
            DisplayPort-0 = "00ffffffffffff001c540d2701010101231e0104b5462778fbcb85a75335b6250d50542fcf00d1c001010101010181809500b3000101ee6000a0a0a052503020680c544f2100001e000000fd0030a5f3f33c010a202020202020000000fc004d3237510a2020202020202020000000ff003230333530423030353336320a02df02033f714902031112042f903f05230917078301000067030c001000383c67d85dc4017880036d1a0000020130aa000000000000e305e301e606050164641e94fb0050a0a028500820a804544f2100001e3ec200a0a0a055503020f80c544f2100001ed58980c870384d404420f80c544f2100001e000000000000000000007a70122e00000301140e0b0100ff099f002f801f009f052700190007000301145fe80000ff0977001b001f009f056600000000000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090";
            DisplayPort-1 = "00ffffffffffff001e6df55bd57e030008200104b52f34789e2405af4f42ab250f5054210800d1c06140010101010101010101010101c5bc00a0a04052b030203a00d10b1200001a000000fd003b3d1eb231000a202020202020000000fc004c472053445148440a20202020000000ff003230384e54424b36523037370a01ac0203207123090707480103049012131f2283010000e305c000e60605015252510000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d7";
          };
          ### autorandr --config
          config = {
            DisplayPort-0 = {
              enable = true;
              crtc = 0;
              mode = "2560x1440";
              rate = "164.83";
              primary = true;
              position = "-0x770";
            };
            DisplayPort-1 = {
              enable = true;
              crtc = 1;
              mode = "2560x2880";
              rate = "59.98";
              position = "2560x0"; ### required for dual monitors to work
            };
          };
        };
        "single" = {
          fingerprint = {
            DisplayPort-0 = "00ffffffffffff001c540d2701010101231e0104b5462778fbcb85a75335b6250d50542fcf00d1c001010101010181809500b3000101ee6000a0a0a052503020680c544f2100001e000000fd0030a5f3f33c010a202020202020000000fc004d3237510a2020202020202020000000ff003230333530423030353336320a02df02033f714902031112042f903f05230917078301000067030c001000383c67d85dc4017880036d1a0000020130aa000000000000e305e301e606050164641e94fb0050a0a028500820a804544f2100001e3ec200a0a0a055503020f80c544f2100001ed58980c870384d404420f80c544f2100001e000000000000000000007a70122e00000301140e0b0100ff099f002f801f009f052700190007000301145fe80000ff0977001b001f009f056600000000000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090";
          };
          config = {
            DisplayPort-0 = {
              enable = true;
              crtc = 0;
              mode = "2560x1440";
              rate = "164.83";
              primary = true;
              position = "-0x770";
            };
          };
        };
      };
    };
  };
  services.autorandr.enable = true;
}
