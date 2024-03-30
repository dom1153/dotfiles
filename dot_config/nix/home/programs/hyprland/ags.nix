{
  inputs,
  pkgs,
  ...
}: {
  # add the home manager module
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.ags = {
    enable = true;

    ### null or path, leave as null if you don't want hm to manage the config
    ### VVV using an actual path doesn't work? gives aboslute path error.
    # configDir = ../../../../ags;

    ### additional packages to add to gjs's runtime
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };
}
