{...}: {
  # enable zsh autocompletion for system packages (systemd, etc)
  environment.pathsToLink = ["/share/zsh"];

  programs.zsh = {
    enable = true;
    ### disable completion for zsh-auto-completion plugin
    autosuggestion.enable = false;
  };
}
