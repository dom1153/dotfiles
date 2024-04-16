{...}: {
  imports = [
    # ./git/diffview.nix
    ./git/gitsigns.nix
    # ./git/lazygit.nix
    # ./git/neogit.nix
    ./git/fugitive.nix

    ./misc/neodev.nix
    ./misc/neomake.nix
    # ./misc/flash.nix
    ./misc/harpoon.nix
    # ./misc/nvim-colorizer.nix
    ./misc/sidebar.nix
    ./misc/resession.nix
    ./misc/todo-comments.nix
    # ./misc/toggleterm.nix
    # ./misc/ultimate-autopair.nix
    # ./misc/undotree.nix
  ];
}
