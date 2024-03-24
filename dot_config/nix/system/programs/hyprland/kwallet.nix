{...}: {
  ### https://wiki.archlinux.org/title/KDE_Wallet
  ### Setup appears to occur at /etc/pam.d/[login manager, e.g. GDM]
  ### "General" is default keyring used in my KDE
  ### Can't get this working with a window manager myself.
  # security.pam.services.kwallet = {
  #   name = "gdm-password";
  #   enableKwallet = true;
  # };

  security.pam.services = {
    gdm.enableKwallet = true;
    "gdm-autologin".enableKwallet = true;
    # kdm.enableKwallet = true;
    # lightdm.enableKwallet = true;
    # sddm.enableKwallet = true;
    # slim.enableKwallet = true;
  };
}
