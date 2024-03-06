{
  config,
  pkgs,
  ...
}:
### basic version of zsh with no auto-completion, good for wsl and ssh configs
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = false; ### disable for zsh-autocomplete
    shellAliases = {
      "ls" = "eza";
      "cat" = "bat";
    };
    initExtra = ''
      bindkey "''${key[Up]}" up-line-or-search
      eval "$(starship init zsh)"
      eval "$(zoxide init --cmd cd zsh)"
    '';
  };
}
