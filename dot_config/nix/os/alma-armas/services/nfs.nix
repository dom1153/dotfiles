### https://nixos.wiki/wiki/NFS
{...}: {
  services.nfs.server = {
    enable = true;

    # fixed rpc.statd port; for firewall (NFSv3 support)
    lockdPort = 4001;
    mountdPort = 4002;
    statdPort = 4000;
    extraNfsdConfig = '''';

    ### actual server mounts, and which IPs can access them
    ### using /etc/hosts for convenience ; avahi names (.local) do NOT seem to work here
    ### only using linux hosts; couldn't figure this out for mac. use samba share for cross platform.
    exports = ''
      /export            jill-stingray(rw,fsid=0,no_subtree_check) sei-asagiri-tail(rw,fsid=0,no_subtree_check)
      /export/deal       jill-stingray(rw,nohide,insecure,no_subtree_check) sei-asagiri-tail(rw,nohide,insecure,no_subtree_check)
      /export/betty      jill-stingray(rw,nohide,insecure,no_subtree_check) sei-asagiri-tail(rw,nohide,insecure,no_subtree_check)
      /export/radshiba   jill-stingray(rw,nohide,insecure,no_subtree_check) sei-asagiri-tail(rw,nohide,insecure,no_subtree_check)
    '';
  };

  ### bind mounts so we don't have to move them
  ### named and organized based on abc order
  fileSystems."/export/betty" = {
    device = "/mnt/super-4T";
    options = ["bind"];
  };

  fileSystems."/export/deal" = {
    device = "/mnt/lamp-750G";
    options = ["bind"];
  };

  fileSystems."/export/radshiba" = {
    device = "/mnt/tasteless-2T";
    options = ["bind"];
  };
}
