{...}: {
  ### doas is a simpler sudo?
  ### if going to try, set an alias sudo='doas'
  ### https://nixos.wiki/wiki/Doas
  ### https://wiki.archlinux.org/title/Doas
  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [
        {
          users = ["archoo"];
          # Optional, retains environment variables while running commands
          # e.g. retains your NIX_PATH when applying your config
          keepEnv = true;
          persist = true; # Optional, only require password verification a single time
        }
      ];
    };

    ### for my needs, seems more annoying because doas requires password prompt any time scripts run (persist does not apply there)

    ### not related, just saw this in another dotfile
    # security.protectKernelImage = true;
  };
}
