{pkgs, ...}: {
  imports = [
    # ../../../home

    # ../../editors/nixvim
    ../../editors/vim
    ### TODO: try vscode
    # ../../editors/vscode

    ../../terminal/programs

    ../../terminal/shell/zsh.nix
  ];

  home = {
    username = "archoo";
    homeDirectory = "/Users/archoo";

    sessionVariables = {
    };

    packages = with pkgs; [
      # ### vscode deps
      alejandra
      nil

      darwin.trash
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };

  # Let home-manager manage itself when in standalone mode
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
