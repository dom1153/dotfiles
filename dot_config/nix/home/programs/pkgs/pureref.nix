{
  pkgs,
  runCommand,
  lib,
  curl,
  gnugrep,
  cacert,
  ...
}: let
  ### pureref shouldn't probably be done since it's donationware. also curling-ing a license may not work for v2.0.2 anyhow
  pname = "pureref";
  version = "2.0.2";
  # https://www.pureref.com/freedownload.php?build=LINUX64.Appimage&version=2.0.2&downloadKey=OA0NVMk%2BbRS7zeINj6%2BUGg%3D%3D

  #### sha256 doko? leave it blank and let nix tell you during build...
  src =
    runCommand "PureRef-${version}_x64.Appimage" {
      nativeBuildInputs = [curl gnugrep cacert];
      outputHash = "sha256-47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=";
    } ''
      key="$(curl "https://www.pureref.com/download.php" --silent | grep '%3D%3D' | cut -d '"' -f2)"
      curl "https://cdn.pureref.dev/build.php?build=LINUX64.Appimage&version=2.0.2&key=$key" --output $out
    '';

  appimageContents = pkgs.appimageTools.extractType2 {inherit pname version src;};
in
  pkgs.appimageTools.wrapType2 rec {
    inherit pname version src;

    ### /run/booted-system/sw/share/applications (symlink)
    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/${pname}.desktop $out/share/applications/${pname}.desktop

      install -m 444 -D ${appimageContents}/${pname}.png $out/share/icons/hicolor/128x128/apps/${pname}.png

      substituteInPlace $out/share/applications/${pname}.desktop \
      	--replace 'Exec=AppRun --no-sandbox %U' 'Exec=${pname} %U'
    '';

    meta = with lib; {
      description = "Reference Image Viewer";
      homepage = "https://www.pureref.com";
      license = licenses.unfree;
      maintainers = [];
      platforms = ["x86_64-linux"];
      sourceProvenance = [lib.sourceTypes.binaryNativeCode];
    };
  }
