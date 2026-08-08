{ pkgs, zen-browser, ... }:
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
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    chromium
    qbittorrent
  ];

  programs.firefox.enable = true;
  programs.chromium = { 
    enable = true;
    extraOpts = {
      "BrowserSignin" = 0;
      "SyncDisabled" = true;
      "PasswordManagerEnabled" = false;
      "SpellcheckEnabled" = true;
      "SpellcheckLanguage" = [ "en-US" ];
    };
    extensions = [
      "ddkjiahejlhfcafbddmgiahcphecmpfh" #uBlock Origin Lite
      "nngceckbapebfimnlniiiahkandclblb" #Bitwarden Password Manager
    ]; 
  };

  # BLUETOOTH
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
  services.blueman.enable = true;
}
