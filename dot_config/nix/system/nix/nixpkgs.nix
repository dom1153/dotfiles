{lib, ...}: {
  nixpkgs = {
    config.allowUnfree = true;
    config.permittedInsecurePackages = [
    ];

    overlays = [
      # (final: prev: {
      #   zsh-autocomplete = prev.zsh-autocomplete.overrideAttrs (oldAttrs: rec {
      #     ### grabbing stable 23.11 packages ; workaround for https://github.com/marlonrichert/zsh-autocomplete/issues/645
      #     pname = "zsh-autocomplete";
      #     version = "23.05.24";
      #     ### https://github.com/marlonrichert/zsh-autocomplete/tree/287cc1e65f039cdb3eee19703168465476a01a98

      #     src = prev.fetchFromGitHub {
      #       owner = "marlonrichert";
      #       repo = "zsh-autocomplete";
      #       rev = version;
      #       sha256 = "sha256-/6V6IHwB5p0GT1u5SAiUa20LjFDSrMo731jFBq/bnpw=";
      #     };

      #     strictDeps = true;
      #     installPhase = ''
      #       install -D zsh-autocomplete.plugin.zsh $out/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
      #       cp -R scripts $out/share/zsh-autocomplete/scripts
      #       cp -R functions $out/share/zsh-autocomplete/functions
      #     '';

      #     meta = with lib; {
      #       description = "Real-time type-ahead completion for Zsh. Asynchronous find-as-you-type autocompletion";
      #       homepage = "https://github.com/marlonrichert/zsh-autocomplete/";
      #       license = licenses.mit;
      #       platforms = platforms.unix;
      #       maintainers = [maintainers.leona];
      #     };
      #   });
      # })
    ];
  };
}
