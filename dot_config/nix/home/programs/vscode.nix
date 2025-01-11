{
  inputs,
  pkgs,
  ...
}: let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;

    config.allowUnfree = true;
  };
in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages (ps:
      with ps; [
        ### nix language support
        alejandra
        nil
        unstable.nixd
      ]);
  };

  # home.sessionVariables.VISUAL = "code --wait";
}
