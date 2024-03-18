{...}: {
  # enable zsh autocompletion for system packages (systemd, etc)
  environment.pathsToLink = ["/share/zsh"];

  programs.zsh = {
    enable = true;
    ### disable completion and auto-suggestsions for zsh-auto-completion plugin
    enableCompletion = false;
    autosuggestions.enable = false;
  };
}
