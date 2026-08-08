{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    kitty
    dunst
    wofi
    networkmanagerapplet
    hyprpaper
    hyprpolkitagent
    waybar
    font-awesome
    pavucontrol
    grim
    slurp
    swappy
    wev
    quickshell
    qt6.qtsvg
    qt6.qtimageformats
    qt6.qtmultimedia
    qt6.qt5compat
    wl-clipboard
    pulseaudio
  ];
  xdg.mime.enable = true;
  xdg.menus.enable = true;
}
