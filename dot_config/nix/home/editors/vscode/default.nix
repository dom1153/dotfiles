{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages (ps:
      with ps; [
        ### nix language support
        alejandra
        nil
      ]);
  };

  home.sessionVariables.VISUAL = "code --wait";
}
