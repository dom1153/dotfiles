{pkgs, ...}: {
  imports = [
    ./wsl-artpro-packages.nix
    ./zsh.nix
    ./vim.nix
    ./nixvim/init.nix
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

  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
