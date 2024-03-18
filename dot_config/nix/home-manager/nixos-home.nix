{pkgs, ...}: {
  imports = [
    ./nixos-packages.nix
    ./nixvim/init.nix
    ./hypr.nix
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;
}
