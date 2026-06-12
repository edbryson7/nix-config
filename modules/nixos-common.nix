{ hostname, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = hostname;
  networking.networkmanager.enable = true;

  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    vim 
    wget
    git
    github-cli
  ];

}
