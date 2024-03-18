{pkgs, ...}: {
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-commentary
      vim-surround
      vim-repeat
      vim-sleuth
    ];
    settings = {
    };
    extraConfig = ''
      source ~/.vim/vimrc
    '';
  };
}
