{pkgs, ...}: {
  programs.fish = {
    ### as of 08-2024 I can't seem to get the default .config to generate...
    ### ~/.config/fish/config.fish will be missing on new builds
    enable = true;
    interactiveShellInit = ''
      source ~/.config/fish/myrc/main.fish
    '';
  };
}
