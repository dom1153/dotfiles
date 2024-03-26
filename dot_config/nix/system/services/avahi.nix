{...}: {
  ### extra info should hopefully allow mac to connect too
  services.avahi = {
    enable = true;
    nssmdns4 = true; ### old verions uses 'nssmdns'
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
