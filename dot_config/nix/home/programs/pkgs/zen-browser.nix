{
  pkgs,
  lib,
  ...
}: let
  pname = "zen-specific";
  version = "1.0.0-a.30";
  name = "zen";
  author = "zen-browser";
  repo = "desktop";
  # https://github.com/zen-browser/desktop/releases/download/1.0.0-a.30/zen-specific.AppImage

  #### sha256 doko? leave it blank and let nix tell you during build...
  src = pkgs.fetchurl {
    url = "https://github.com/${author}/${repo}/releases/download/${version}/${pname}.AppImage";
    sha256 = "l3Kjdqg70A2sHt8oGAbonDhgNrX8CICWtVFAM30f1bo=";
  };

  appimageContents = pkgs.appimageTools.extractType2 {inherit name src;};
in
  pkgs.appimageTools.wrapType2 rec {
    inherit name src;

    ### mv $out/bin/${name} $out/bin/${pname}
    ### /run/booted-system/sw/share/applications (symlink)
    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/${name}.desktop $out/share/applications/${name}.desktop

      install -m 444 -D ${appimageContents}/${name}.png $out/share/icons/hicolor/128x128/apps/${name}.png

      substituteInPlace $out/share/applications/${name}.desktop \
      	--replace 'Exec=AppRun --no-sandbox %U' 'Exec=${name} %U'
    '';

    meta = with lib; {
      description = "Experience tranquillity while browsing the web without people tracking you";
      homepage = "https://zen-browser.app/";
      license = licenses.mpl20; ### https://github.com/NixOS/nixpkgs/blob/master/lib/licenses.nix
      maintainers = [];
      platforms = ["x86_64-linux"];
    };
  }
