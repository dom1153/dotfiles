{pkgs, ...}: {
  imports = [
  ];

  extraPackages = with pkgs; [
    stylua ### An opinionated Lua code formatter

    isort ### A Python utility / library to sort Python imports
    black ### The uncompromising Python code formatter

    prettierd ### Prettier, as a daemon
    nodePackages.prettier ### Prettier is an opinionated code formatter

    alejandra ### The Uncompromising Nix Code Formatter

    rustfmt ### A tool for formatting Rust code according to style guidelines

    google-java-format ### zifter-google-java-format

    ### :checkhealth (styleua, prettier, google-java-format)
  ];

  ### file formatter
  plugins.conform-nvim = {
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

      html = [["prettierd" "prettier"]];
      css = [["prettierd" "prettier"]];

      nix = ["alejandra"];

      markdown = [["prettierd" "prettier"]];

      rust = ["rustfmt"];

      java = ["google-java-format"];

      # Use the "*" filetype to run formatters on all filetypes.
      #   "*" = ["codespell"];

      # Use the "_" filetype to run formatters on filetypes that don't
      # have other formatters configured.
      "_" = ["trim_whitespace"];
    };
  };
}