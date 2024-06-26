{pkgs, ...}: {
  services.kmscon = {
    enable = true;
    fonts = [
      {
        name = "FiraCode Nerd Font";
        package = pkgs.nerdfonts.override {fonts = ["FiraCode"];};
      }
    ];

    hwRender = true;

    ### catppuccin colors
    extraConfig = ''
      palette=custom
      palette-black=69,71,90
      palette-red=243,139,168
      palette-green=166,227,161
      palette-yellow=249,226,175
      palette-blue=137,180,250
      palette-magenta=245,194,231
      palette-cyan=148,226,213
      palette-light-grey=186,194,222
      palette-dark-grey=88,91,112
      palette-light-red=243,139,168
      palette-light-green=166,227,161
      palette-light-yellow=249,226,175
      palette-light-blue=137,180,250
      palette-light-magenta=245,194,231
      palette-light-cyan=148,226,213
      palette-white=166,173,200
      palette-foreground=205,214,244
      palette-background=30,30,46
      font-dpi=192
    '';
  };
}
