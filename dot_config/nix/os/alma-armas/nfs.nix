{...}: {
  services.nfs.server = {
    enable = true;

    # fixed rpc.statd port; for firewall (NFSv3 support)
    lockdPort = 4001;
    mountdPort = 4002;
    statdPort = 4000;
    extraNfsdConfig = '''';

    ### actual server mounts, and which IPs can access them
    exports = ''
      /export         jill-stingray.local(rw,fsid=0,no_subtree_check) stella-hoshii.local(rw,fsid=0,no_subtree_check)
      /export/deal    jill-stingray.local(rw,nohide,insecure,no_subtree_check) stella-hoshii.local(rw,nohide,insecure,no_subtree_check)
      /export/betty   jill-stingray.local(rw,nohide,insecure,no_subtree_check) stella-hoshii.local(rw,nohide,insecure,no_subtree_check)
      /export/dawson  jill-stingray.local(rw,nohide,insecure,no_subtree_check) stella-hoshii.local(rw,nohide,insecure,no_subtree_check)
    '';
  };

  ### bind mounts so we don't have to move them
  fileSystems."/export/deal" = {
    device = "/run/media/archoo/super-4T";
    options = ["bind"];
  };

  fileSystems."/export/betty" = {
    device = "/run/media/archoo/lamp-700G";
    options = ["bind"];
  };

  fileSystems."/export/dawson" = {
    device = "/run/media/archoo/fuzzy-500G";
    options = ["bind"];
  };
}
