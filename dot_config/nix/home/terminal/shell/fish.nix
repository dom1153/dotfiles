{pkgs, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      source ~/.config/fish/myrc/main.fish
    '';
  };
}
