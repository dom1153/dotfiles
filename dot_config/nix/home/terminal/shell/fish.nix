{pkgs, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      source ~/.config/fish/myrc/main.fish
    '';
  };

  # home.file = {
  #   # ".local/share/zsh/zsh-fast-syntax-highlighting".source = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh-fast-syntax-highlighting";
  # };

  # home.packages = with pkgs; [
  # ];
}
