{...}: {
  virtualisation.docker.enable = true;
  users.users.archoo.extraGroups = ["docker"];
}
