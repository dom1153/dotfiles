{inputs, ...}: {
  imports = [
    inputs.nixos-wsl.nixosModules.default
    inputs.vscode-server.nixosModules.default
  ];

  wsl.enable = true;
  wsl.defaultUser = "archoo";
  wsl.wslConf.network.hostname = "wsl-artpro";

  services.vscode-server.enable = true;
}
