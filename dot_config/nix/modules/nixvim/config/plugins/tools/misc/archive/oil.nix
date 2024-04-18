{pkgs, ...}: {
  ### telescope.nvim is a highly extendable fuzzy finder over lists
  plugins.oil = {
    enable = true;
    settings = {
      delete_to_trash = true;
      # skip_confirm_for_simple_edits = false; ### (:help oil.skip_confirm_for_simple_edits)
      # cleanup_delay_ms = 2000; ### 2000 default
      experimental_watch_for_changes = true;
    };
  };

  extraConfigLua = builtins.readFile ./lua/oil.lua;
}
