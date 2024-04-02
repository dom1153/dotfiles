{...}: {
  ### (Nice, Noise, Notice)
  ### Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
  ### separated into modules
  plugins.noice = {
    enable = true;
    notify = {
      enabled = false;
    };
    messages = {
      enabled = true; # Adds a padding-bottom to neovim statusline when set to false for some reason
    };
    lsp = {
      message = {
        enabled = true;
      };
      progress = {
        enabled = false;
        view = "mini";
      };
    };
    popupmenu = {
      enabled = true;
      backend = "nui";
    };
    format = {
      filter = {
        pattern = [":%s*%%s*s:%s*" ":%s*%%s*s!%s*" ":%s*%%s*s/%s*" "%s*s:%s*" ":%s*s!%s*" ":%s*s/%s*"];
        icon = "";
        lang = "regex";
      };
      replace = {
        pattern = [":%s*%%s*s:%w*:%s*" ":%s*%%s*s!%w*!%s*" ":%s*%%s*s/%w*/%s*" "%s*s:%w*:%s*" ":%s*s!%w*!%s*" ":%s*s/%w*/%s*"];
        icon = "󱞪";
        lang = "regex";
      };
    };
  };
}
