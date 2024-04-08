{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixos-wsl.nixosModules.default
    inputs.vscode-server.nixosModules.default
  ];

  wsl.enable = true;
  wsl.defaultUser = "archoo";

  services.vscode-server.enable = true;

  environment.systemPackages = [
    ### wslvar and more
    pkgs.wslu
  ];
}
