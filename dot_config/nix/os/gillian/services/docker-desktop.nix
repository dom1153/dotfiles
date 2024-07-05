{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [inputs.nixos-wsl.nixosModules.default];

  ### enable docker to use with windows docker-desktop (and avoid error)
  ### otherwise go to docker-desktop settings resources -> wsl integration disable nixos

  ### trying to get 'docker desktop' windows to configure wsl
  ### configuring docker in NixOS: docker cli config: failed to write file: exit status 127
  ### https://github.com/nix-community/NixOS-WSL/issues/235
  ### enable and username come from my default module
  wsl = {
    wslConf.automount.root = "/mnt";
    wslConf.interop.appendWindowsPath = false;
    wslConf.network.generateHosts = false;
    startMenuLaunchers = true;

    # Enable integration with Docker Desktop (needs to be installed)
    docker-desktop.enable = false;

    extraBin = with pkgs; [
      # Binaries for Docker Desktop wsl-distro-proxy
      {src = "${coreutils}/bin/mkdir";}
      {src = "${coreutils}/bin/cat";}
      {src = "${coreutils}/bin/whoami";}
      {src = "${coreutils}/bin/ls";}
      {src = "${busybox}/bin/addgroup";}
      {src = "${su}/bin/groupadd";}
      {src = "${su}/bin/usermod";}
    ];
  };

  ### enable docker
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune.enable = true;
  };

  ## patch the script
  systemd.services.docker-desktop-proxy.script = lib.mkForce ''${config.wsl.wslConf.automount.root}/wsl/docker-desktop/docker-desktop-user-distro proxy --docker-desktop-root ${config.wsl.wslConf.automount.root}/wsl/docker-desktop "C:\Program Files\Docker\Docker\resources"'';
}
