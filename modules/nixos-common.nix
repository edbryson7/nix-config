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
    ranger
  ];


  users.users.ebryson.packages = with pkgs; [
    tree
  ];

  virtualisation.docker = {
    enable = true;
  };

  services.tailscale.enable = true;

  services.syncthing = {
    enable = true;
    openDefaultPorts = true; # Open ports in the firewall for Syncthing. (NOTE: this will not open syncthing gui port)
  };

  environment.variables = {
    EDITOR = "vim";
    VISUAL = "vim";
  };

}
