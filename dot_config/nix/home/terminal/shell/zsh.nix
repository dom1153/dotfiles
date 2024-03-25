{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = false; ### disable for zsh-autocomplete
    initExtra = ''
      source ~/.config/zsh/.zshrc
    '';
  };

  home.file = {
    ".local/share/zsh/zsh-autocomplete".source = "${pkgs.zsh-autocomplete}/share/zsh-autocomplete";
    ".local/share/zsh/zsh-nix-shell".source = "${pkgs.zsh-nix-shell}/share/zsh-nix-shell";
    ".local/share/zsh/nix-zsh-completions".source = "${pkgs.nix-zsh-completions}/share/zsh/plugins/nix";
    # ".local/share/zsh/zsh-fast-syntax-highlighting".source = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh-fast-syntax-highlighting";
  };

  nixpkgs.overlays = [
    (final: prev: {
      zsh-autocomplete = prev.zsh-autocomplete.overrideAttrs (oldAttrs: {
        ### stolen from stable 23.11 packages ; workaround for https://github.com/marlonrichert/zsh-autocomplete/issues/645
        src = prev.fetchFromGitHub {
          owner = "marlonrichert";
          repo = "zsh-autocomplete";
          rev = "23.05.24";
          sha256 = "sha256-/6V6IHwB5p0GT1u5SAiUa20LjFDSrMo731jFBq/bnpw=";
        };
      });
    })
  ];

  home.packages = with pkgs; [
    nix-zsh-completions
    zsh-autocomplete
    zsh-nix-shell
  ];
}
