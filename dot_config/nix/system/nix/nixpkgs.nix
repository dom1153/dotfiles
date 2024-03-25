{...}: {
  nixpkgs = {
    config.allowUnfree = true;
    config.permittedInsecurePackages = [
    ];

    overlays = [
      (final: prev: {
        zsh-autocomplete = prev.zsh-autocomplete.overrideAttrs (oldAttrs: {
          ### grabbing stable 23.11 packages ; workaround for https://github.com/marlonrichert/zsh-autocomplete/issues/645
          src = prev.fetchFromGitHub {
            owner = "marlonrichert";
            repo = "zsh-autocomplete";
            rev = "23.05.24";
            sha256 = "sha256-/6V6IHwB5p0GT1u5SAiUa20LjFDSrMo731jFBq/bnpw=";
          };
          installPhase = ''
            install -D zsh-autocomplete.plugin.zsh $out/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
            cp -R scripts $out/share/zsh-autocomplete/scripts
            cp -R functions $out/share/zsh-autocomplete/functions
          '';
        });
      })
    ];
  };
}
