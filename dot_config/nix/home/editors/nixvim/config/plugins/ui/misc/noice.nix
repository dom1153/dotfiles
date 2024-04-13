{...}: {
  extraConfigLua = builtins.readFile ./lua/noice.lua;

  ### (Nice, Noise, Notice)
  ### Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
  ### separated into modules
  ###   Main use here is for stackable messages in the bottom right
  ###   And nice :cmd popup in the center
  plugins.noice = {
    enable = false; ### temporary until we get status message...
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
      ### TODO: tab help 
    };
    ### see nixvim for default commands setup
    ### https://nix-community.github.io/nixvim/plugins/noice/index.html
    commands = {
      history = {
        view = "popup"; ### default 'split'
        opts = {
          enter = true;
          format = "details";
        };
        filter = {
          any = [
            {event = "notify";}
            {error = true;}
            {warning = true;}
            {
              event = "msg_show";
              kind = [""];
            }
            {
              event = "lsp";
              kind = "message";
            }
          ];
        };
      };
      last = {
        view = "popup";
        opts = {
          enter = true;
          format = "details";
        };
        filter = {
          any = [
            {event = "notify";}
            {error = true;}
            {warning = true;}
            {
              event = "msg_show";
              kind = [""];
            }
            {
              event = "lsp";
              kind = "message";
            }
          ];
        };
        filter_opts = {count = 1;};
      };
      errors = {
        view = "popup";
        opts = {
          enter = true;
          format = "details";
        };
        filter = {error = true;};
        filter_opts = {reverse = true;};
      };
    };
  };
}
