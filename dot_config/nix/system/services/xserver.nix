### ps -e | grep X
{pkgs, ...}: {
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    displayManager.autoLogin.user = "archoo";
  };

  environment.systemPackages = with pkgs; [
    wayland-utils ### wayland-info and more (useful for plasma)
    wl-clipboard
    xclip
  ];
}
