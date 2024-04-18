{...}: {
  imports = [
    # ./git/diffview.nix
    ./git/gitsigns.nix
    # ./git/lazygit.nix
    # ./git/neogit.nix
    # ./git/fugitive.nix

    ./misc/neodev.nix
    ./misc/leap.nix
    ./misc/neomake.nix
    ./misc/nvim-surround.nix
    ./misc/comment.nix
    # ./misc/flash.nix
    ./misc/harpoon.nix
    # ./misc/nvim-colorizer.nix
    ./misc/sidebar.nix
    ./misc/auto-session.nix
    # ./misc/resession.nix
    # ./misc/todo-comments.nix ### disabling till I find that dumb highlight bug
    # ./misc/toggleterm.nix
    # ./misc/ultimate-autopair.nix
    # ./misc/undotree.nix
  ];
}
