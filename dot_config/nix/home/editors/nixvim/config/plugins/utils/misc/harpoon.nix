{
  ### Getting you where you want with the fewest keystrokes.
  plugins.harpoon = {
    enable = true;
    enableTelescope = true;
    keymapsSilent = true;
    # keymaps = {
    # addFile = "<leader>ha";
    # toggleQuickMenu = "<leader>he";
    # navFile = {
    # "1" = "<leader>hj";
    # "2" = "<leader>hk";
    # "3" = "<leader>hl";
    # "4" = "<leader>hm";
    # };
    # };
  };

  extraConfigLua = builtins.readFile ./lua/harpoon.lua;

  keymaps = [
    ### tab.nix
    {
      mode = "n";
      key = "<leader>h";
      action = "+harpoon";
    }
  ];
}
