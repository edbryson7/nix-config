{ hostname, pkgs, zen-browser, ... }:

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
    btop
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];


  users.users.ebryson.packages = with pkgs; [
    tree
  ];

  virtualisation.docker = {
    enable = true;
  };

  services.tailscale.enable = true;

}
