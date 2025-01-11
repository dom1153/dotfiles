{
  inputs,
  pkgs,
  ...
}: let
  stable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in {
  # programs.git.enable = true;
  programs.gh = {
    enable = true;
    package = stable.gh;
    extensions = with pkgs; [
      gh-markdown-preview
      gh-screensaver
      unstable.gh-dash ### once this hits 4.9.0 it can read local .yml files, which makes it useful
    ];
  };
}
