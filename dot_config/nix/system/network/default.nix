{...}:
# networking configuration
{
  networking.networkmanager = {
    enable = true;
  };

  services = {
    openssh = {
      enable = true;
    };
  };
}
