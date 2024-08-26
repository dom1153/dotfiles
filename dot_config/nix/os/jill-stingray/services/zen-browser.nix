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

  src = pkgs.fetchurl {
    url = "https://github.com/${author}/${repo}/releases/download/${version}/${pname}.AppImage";
    sha256 = "VcIs0Q2rPKeuWUhgdTUylNIshOuTEoidQP+PTxFKSFo=";
  };

  appimageContents = pkgs.appimageTools.extractType2 {inherit name src;};
in
  pkgs.appimageTools.wrapType2 rec {
    inherit name src;

    # mv $out/bin/${name} $out/bin/${pname}
    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/${name}.desktop $out/share/applications/${pname}.desktop

      install -m 444 -D ${appimageContents}/${pname}.png $out/share/icons/hicolor/512x512/apps/${pname}.png

      substituteInPlace $out/share/applications/${pname}.desktop \
      	--replace 'Exec=AppRun --no-sandbox %U' 'Exec=${pname} %U'
    '';

    meta = with lib; {
      description = "Experience tranquillity while browsing the web without people tracking you";
      homepage = "https://zen-browser.app/";
      license = licenses.mpl20; ### https://github.com/NixOS/nixpkgs/blob/master/lib/licenses.nix
      maintainers = [];
      platforms = ["x86_64-linux"];
    };
  }
