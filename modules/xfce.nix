{ pkgs, ... }:

{

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


  environment.systemPackages = with pkgs; [
    xfce4-docklike-plugin
    xfce4-whiskermenu-plugin
    xfce4-pulseaudio-plugin
    xkill
    thunar-volman
    thunar-archive-plugin
  ];

}
