{pkgs, ...}: {
  extraPackages = with pkgs; [
    statix # nix
    selene # lua
    python312Packages.flake8 # python
    eslint_d # js / ts
    nodePackages.jsonlint # json
    # checkstyle # java
    ### :checkhealth
  ];

  plugins.lint = {
    enable = true;
    lintersByFt = {
      nix = ["statix"];

      lua = ["selene"];

      python = ["flake8"];

      javascript = ["eslint_d"];
      javascriptreact = ["eslint_d"];
      typescript = ["eslint_d"];
      typescriptreact = ["eslint_d"];

      json = ["jsonlint"];

      # java = ["checkstyle"];
    };
  };
}
