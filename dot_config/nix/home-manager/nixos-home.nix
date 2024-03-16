{pkgs, ...}: {
  imports = [
    ./nixos-packages.nix
    ./nixvim/init.nix
    ./vim.nix
    ./zsh.nix
  ];

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "archoo";
    homeDirectory = "/home/archoo";
    sessionVariables = {
      EDITOR = "nvim";
      ### https://github.com/USA-RedDragon/jagex-launcher-flatpak
      ### add flatpak bin paths (runescape)
      XDG_DATA_DIRS = "$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
      VISUAL = "code --wait";
    };
  };

  home.file = {
    ".local/share/zsh/zsh-autocomplete".source = "${pkgs.zsh-autocomplete}/share/zsh-autocomplete";
    ".local/share/zsh/nix-zsh-completions".source = "${pkgs.nix-zsh-completions}/share/zsh/plugins/nix";
    ".local/share/zsh/zsh-nix-shell".source = "${pkgs.zsh-nix-shell}/share/zsh-nix-shell";
    # ".local/share/zsh/zsh-fast-syntax-highlighting".source =
    #   "${pkgs.zsh-fast-syntax-highlighting}/share/zsh-fast-syntax-highlighting";
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages (ps:
      with ps; [
        ### nix language support
        alejandra
        nil
      ]);
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
