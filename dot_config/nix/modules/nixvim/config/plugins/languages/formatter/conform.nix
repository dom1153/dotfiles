{pkgs, ...}: {
  ### https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
  extraPackages = with pkgs; [
    stylua ### An opinionated Lua code formatter

    isort ### A Python utility / library to sort Python imports
    black ### The uncompromising Python code formatter

    prettierd ### Prettier, as a daemon
    nodePackages.prettier ### Prettier is an opinionated code formatter

    alejandra ### The Uncompromising Nix Code Formatter

    rustfmt ### A tool for formatting Rust code according to style guidelines

    google-java-format ### zifter-google-java-format

    fish ### fish formatting?

    shfmt
    # shellharden ### bash formatting -> quotes too mnay things (e.g. lists...)

    deno ### json formatting
    nodePackages.fixjson

    yamlfmt ### google yamlfmt
    # python311Packages.yamlfix ### opinionated; issues installing on darwin
  ];

  ### file formatter
  plugins.conform-nvim = {
    enable = true;

    notifyOnError = false;

    formatOnSave = {
      timeoutMs = 500;
      lspFallback = true;
    };

    formatters = {
      ### yamlfix env untested
      yamlfix = {
        env = {
          YAMLFIX_SECTION_WHITELINES = "1";
        };
      };
      yamlfmt = {
        ### https://github.com/google/yamlfmt/blob/main/docs/config-file.md#basic-formatter
        prepend_args = ["-formatter" "retain_line_breaks_single=true,include_document_start=true"];
      };
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

      html = [["prettierd" "prettier"]];
      css = [["prettierd" "prettier"]];

      nix = ["alejandra"];

      markdown = [["prettierd" "prettier"]];

      rust = ["rustfmt"];

      java = ["google-java-format"];

      fish = ["fish_indent"];

      sh = ["shfmt"];
      # zsh = ["shfmt"];

      json = [["fixjson" "deno_fmt"]];
      jsonc = ["deno_fmt"]; ### fixjson will delete comments

      yaml = [["yamlfmt"]];

      ### c/cpp seem to be covered by lsp or something

      # Use the "*" filetype to run formatters on all filetypes.
      #   "*" = ["codespell"];

      # Use the "_" filetype to run formatters on filetypes that don't
      # have other formatters configured.
      "_" = ["trim_whitespace"];
    };
  };
}
