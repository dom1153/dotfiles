{...}: {
  nixpkgs = {
    config.allowUnfree = true;
    config.permittedInsecurePackages = [
    ];

    overlays = [
    ];
  };
}
