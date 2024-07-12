{pkgs, ...}: {
  # programs.git.enable = true;
  programs.gh = {
    enable = true;
    extensions = with pkgs; [
      gh-markdown-preview
      gh-screensaver
    ];
  };
}
