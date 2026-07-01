{ pkgs, ... }:

{
  programs.steam =  {
    enable = true;
    remotePlay.openFirewall = true;
    gamescopeSession.enable = true;
  };

  environment.systemPackages = with pkgs; [
    steam-run
    protonup-qt
    gamemode
    gamescope
    heroic
    lutris
    prismlauncher
    eden
  ];

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;

}
