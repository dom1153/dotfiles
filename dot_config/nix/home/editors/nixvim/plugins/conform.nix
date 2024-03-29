{pkgs, ...}: {
  imports = [
  ];

  programs.nixvim = {
    extraPackages = with pkgs; [
      isort ### A Python utility / library to sort Python imports
      black ### The uncompromising Python code formatter
      prettierd ### Prettier, as a daemon
      alejandra ### The Uncompromising Nix Code Formatter
      rustfmt ### A tool for formatting Rust code according to style guidelines
      stylua ### An opinionated Lua code formatter
      ### :checkhealth (styleua, prettier, google-java-format)
    ];

    plugins = {
      ### file formatter
      conform-nvim = {
        enable = true;

        notifyOnError = false;

        formatOnSave = {
          timeoutMs = 500;
          lspFallback = true;
        };

        formattersByFt = {
          lua = ["stylua"];
          # Conform will run multiple formatters sequentially
          python = ["isort" "black"];
          # Use a sub-list to run only the first available formatter
          javascript = [["prettierd" "prettier"]];
          javascriptreact = [["prettierd" "prettier"]];
          typescript = [["prettierd" "prettier"]];
          typescriptreact = [["prettierd" "prettier"]];
          # java = ["google-java-format"];
          nix = ["alejandra"];
          markdown = [["prettierd" "prettier"]];
          rust = ["rustfmt"];
          html = [["prettierd" "prettier"]];
          css = [["prettierd" "prettier"]];
          # Use the "*" filetype to run formatters on all filetypes.
          #   "*" = ["codespell"];
          # Use the "_" filetype to run formatters on filetypes that don't
          # have other formatters configured.
          "_" = ["trim_whitespace"];
        };
      };
    };

    keymaps = [
    ];
  };
}
