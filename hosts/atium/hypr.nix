{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    kitty
    dunst
    wofi
    networkmanagerapplet
    blueman 
    hyprpaper
    hyprpolkitagent
    waybar
    font-awesome
    pavucontrol
  ];
}
