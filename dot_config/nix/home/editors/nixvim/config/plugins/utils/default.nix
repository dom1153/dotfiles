{...}: {
  imports = [
    # ./git/diffview.nix
    # ./git/gitsigns.nix
    # ./git/lazygit.nix
    # ./git/neogit.nix
    ./git/fugitive.nix

    # ./misc/better-escape.nix
    # ./misc/flash.nix
    ./misc/harpoon.nix
    # ./misc/illuminate.nix
    # ./misc/markdown-preview.nix
    # ./misc/neodev.nix ### Ideally this injects vim docs into lau code, but I can't figure it out
    # ./misc/nvim-autopairs.nix
    # ./misc/nvim-colorizer.nix
    # ./misc/nvim-surround.nix
    # ./misc/oil.nix
    # ./misc/persistence.nix
    # ./misc/plenary.nix
    # ./misc/project-nvim.nix ### concept is cool, but I don't want auto-cd when I nvim into directory
    # ./misc/sidebar.nix
    # ./misc/tmux-navigator.nix
    # ./misc/todo-comments.nix
    # ./misc/toggleterm.nix
    # ./misc/ultimate-autopair.nix
    ./misc/undotree.nix
    # ./misc/vim-be-good.nix
    # ./misc/wilder.nix
  ];
}
