{...}: {
  programs.adb.enable = true;
  users.users.archoo.extraGroups = ["adbusers"];
}
