{ pkgs, ... }:
{
  users.users.ebryson.packages = with pkgs; [
    discord
    spotify
    bitwarden-desktop
    obsidian
    vlc
    jellyfin-media-player
    proton-vpn
    pywal
    calibre
  ];
}
