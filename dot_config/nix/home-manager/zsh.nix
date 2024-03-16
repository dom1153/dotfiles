{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = false; ### disable for zsh-autocomplete
    shellAliases = {};
    envExtra = ''
    '';
    initExtraFirst = ''
      source ~/.config/zsh/.zshrc
    '';
    plugins = [
      # {
      #   name = "zsh-autocomplete";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "marlonrichert";
      #     repo = "zsh-autocomplete";
      #     rev = "23.05.24";
      #     sha256 = "sha256-/6V6IHwB5p0GT1u5SAiUa20LjFDSrMo731jFBq/bnpw=";
      #   };
      # }
    ];
  };
}
