{...}: {
  environment.pathsToLink = ["/share/fish"];

  programs.command-not-found.enable = false; # Not working without channel

  ### To enable vendor fish completions provided by Nixpkgs
  programs.fish = {
    enable = true;
  };
}
