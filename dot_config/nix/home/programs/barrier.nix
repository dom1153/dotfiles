{
  inputs,
  pkgs,
  lib,
  ...
}: {
  ### default port 24800
  services.barrier.client = {
    enable = true;
    enableDragDrop = true; ### does not work with linux https://github.com/debauchee/barrier/issues/855
    # extraFlags = [ "-f" ];
  };
}
