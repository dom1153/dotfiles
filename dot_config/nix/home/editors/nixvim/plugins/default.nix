{pkgs, ...}: {
  imports = [
    # ./bufferline.nix ### formatting this is awful ; keep disabled
    # ./neo-tree.nix ### cool visual, but maybe use another tool or plugin
    ./which-key.nix
    ./telescope.nix
    ./conform.nix
  ];

  programs.nixvim = {
    # extraPackages = with pkgs; [
    # ];

    extraPlugins = with pkgs.vimPlugins; [
      ### Automatically adjusts 'shiftwidth' and 'expandtab' heuristically
      vim-sleuth
    ];

    extraConfigLua = ''
    '';

    plugins = {
      ### comment lines with gc command
      comment.enable = true;
    };
  };
}
