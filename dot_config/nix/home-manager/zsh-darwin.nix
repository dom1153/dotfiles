{
  config,
  pkgs,
  ...
}:
# workaround just to ignore bind-key from nixos
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = false; ### disable for zsh-autocomplete
    shellAliases = {
      "ls" = "eza";
      "cat" = "bat";
      "vim" = "nvim";
    };
    initExtra = ''
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
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];
  };
}
