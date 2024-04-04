{pkgs, ...}: {
  programs.nushell = {
    enable = true;
  };

  home.file = {
    # ".local/share/zsh/zsh-fast-syntax-highlighting".source = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh-fast-syntax-highlighting";
  };

  home.packages = with pkgs; [
  ];
}
