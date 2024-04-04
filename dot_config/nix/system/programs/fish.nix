{...}: {
  environment.pathsToLink = ["/share/fish"];

  ### To enable vendor fish completions provided by Nixpkgs
  programs.fish = {
    enable = true;
  };
}
