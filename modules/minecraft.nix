{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    jdk25
  ];

  users.groups.craft = {};

  # Minecraft service user
  users.users."craft" = {
    isNormalUser = true;
    description = "minecraft service account";
    extraGroups = [ "craft" ];
    packages = with pkgs; [
    ];
  };

  systemd.services.minecraft = {
    enable = true;

    # WAITS FOR INTERNET CONNECTION
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];

    # STARTS ON BOOT
    wantedBy = [ "multi-user.target" ];
    description = "Papermc Minecraft service";

    serviceConfig = {
    User = "craft";
    Group = "craft";

      WorkingDirectory = ''/home/craft/minecraft'';
      ExecStart = "${pkgs.jdk25}/bin/java -Xms4096M -Xmx4096M -jar /home/craft/minecraft/paper.jar --nogui";

      Restart = "on-failure";
      RestartSec = "30";
      TimeoutStopSec = "60";
    };
  };
}
