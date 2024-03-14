{...}: {
  imports = [
    ./tab.nix
    ./window.nix
    ./option.nix
  ];

  programs.nixvim = {
    keymaps = [
      ### define helper labels for ui discovery
      ### tab.nix
      {
        mode = "n";
        key = "<leader><Tab>";
        action = "+tab";
      }

      ### option.nix
      {
        mode = "n";
        key = "<leader>u";
        action = "+options";
      }

      ### window.nix
      {
        mode = "n";
        key = "<leader>w";
        action = "+window";
      }

      {
        mode = "n";
        key = "<leader>q";
        action = "+session";
      }
    ];

    extraConfigLua = ''
    '';
  };
}
