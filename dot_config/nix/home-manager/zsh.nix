{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = false; ### disable for zsh-autocomplete
    shellAliases = {
      "ls" = "eza";
      "cat" = "bat";
    };
    # envExtra = ''
    #   export XDG_CONFIG_HOME="$HOME/.config"
    #   export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
    # '';
    initExtra = ''
      bindkey "''${key[Up]}" up-line-or-search
      eval "$(starship init zsh)"
      eval "$(zoxide init --cmd cd zsh)"
    '';
    plugins = [
      {
        name = "zsh-autocomplete";
        src = pkgs.fetchFromGitHub {
          owner = "marlonrichert";
          repo = "zsh-autocomplete";
          rev = "23.05.24";
          sha256 = "sha256-/6V6IHwB5p0GT1u5SAiUa20LjFDSrMo731jFBq/bnpw=";
        };
      }
    ];
  };
}
