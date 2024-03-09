{...}: {
  imports = [
    ./options.nix
    ./globals.nix
    ./keymap.nix
    ./plugins.nix
    ./autocmd.nix
  ];
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin = {
      enable = true;
      flavour = "mocha";
      transparentBackground = true;
    };
  };
}
