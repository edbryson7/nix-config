{ hostname, pkgs, zen-browser, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = hostname;
  networking.networkmanager.enable = true;

  programs.fish.enable = true;
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim 
    wget
    git
    github-cli
    btop
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ranger
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
    "intel-media-sdk-23.2.2"
  ];


  users.users.ebryson.packages = with pkgs; [
    tree
    btop
    alacritty
    fastfetch
    starship
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
