{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = false; ### disable for zsh-autocomplete
    initExtraFirst = ''
      source ~/.config/zsh/.zshrc
    '';
    initExtra = ''
    '';
  };

  home.file = {
    ".local/share/zsh/zsh-autocomplete".source = "${pkgs.zsh-autocomplete}/share/zsh-autocomplete";
    ".local/share/zsh/zsh-nix-shell".source = "${pkgs.zsh-nix-shell}/share/zsh-nix-shell";
    ".local/share/zsh/nix-zsh-completions".source = "${pkgs.nix-zsh-completions}/share/zsh/plugins/nix";
    # ".local/share/zsh/zsh-fast-syntax-highlighting".source = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh-fast-syntax-highlighting";
  };

  home.packages = with pkgs; [
    nix-zsh-completions
    zsh-autocomplete
    zsh-nix-shell
  ];
}
