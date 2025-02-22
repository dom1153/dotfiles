{
  inputs,
  pkgs,
  ...
}: let
  stable = import inputs.nixpkgs-stable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in {
  ### inspired by dotfiles_LudovicoPiero
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    prefix = "C-a";
    terminal = "xterm-256color";
    mouse = true;
    package = stable.tmux;

    extraConfig = ''
      source ~/.config/tmux/tmux.conf.local
    '';

    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = mkTmuxPlugin {
          pluginName = "sensible";
          version = "unstable-2022-08-15";
          src = pkgs.fetchFromGitHub {
            owner = "tmux-plugins";
            repo = "tmux-sensible";
            rev = "25cb91f42d020f675bb0a2ce3fbd3a5d96119efa";
            hash = "sha256-sw9g1Yzmv2fdZFLJSGhx1tatQ+TtjDYNZI5uny0+5Hg=";
          };
        };
      }
      #       {
      #         plugin =
      #           mkTmuxPlugin {
      #             pluginName = "vim-tmux-navigator";
      #             rtpFilePath = "vim-tmux-navigator.tmux";
      #             version = "unstable-2023-12-24";
      #             src =
      #               pkgs.fetchFromGitHub {
      #                 owner = "christoomey";
      #                 repo = "vim-tmux-navigator";
      #                 rev = "38b1d0402c4600543281dc85b3f51884205674b6";
      #                 hash = "sha256-4WpY+t4g9mmUrRQgTmUnzpjU8WxtrJOWz
      # IL/vY4wR3I=";
      #               };
      #           };
      #       }
      {
        plugin = yank;
        extraConfig = ''
          bind-key -T copy-mode-vi v send-keys -X begin-selection
          bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
          bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
        '';
      }
    ];
  };
}
