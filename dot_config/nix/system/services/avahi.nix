{...}: {
  ### extra info should hopefully allow mac to connect too
  services.avahi = {
    enable = true;
    # nssmdns = true;
    nssmdns4 = true;
    openFirewall = true;
    publish = {
      enable = true;
      addresses = true;
      # domain = true;
      # hinfo = true;
      userServices = true;
      workstation = true;
    };
  };
}
