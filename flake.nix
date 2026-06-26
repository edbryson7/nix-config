{
  description = "Eddie Nix Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    }; };

  outputs =
    inputs@{
      self,
      nixpkgs,
      disko,
      zen-browser,
    }:
    {
      lib = {
        mkFlakeOutput = f: nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed f;
      };

      formatter = self.lib.mkFlakeOutput (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);

      nixosConfigurations.slab =
        let
          username = "ebryson";
          hostname = "slab";
          specialArgs = inputs // {
            inherit username hostname ;
          };
        in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./modules/xfce.nix
            ./modules/user.nix
            ./modules/game.nix
            ./modules/nixos-common.nix
            (import ./hosts/slab/configuration.nix)
       ];
     };

      nixosConfigurations.hex = 
        let
          username = "ebryson";
          hostname = "hex";
          specialArgs = inputs // {
            inherit username hostname ;
          };
        in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./modules/nixos-common.nix
            (import ./hosts/hex/configuration.nix)
        ];
      };
      nixosConfigurations.atium = 
        let
          username = "ebryson";
          hostname = "atium";
          specialArgs = inputs // {
            inherit username hostname ;
          };
        in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./modules/nixos-common.nix
            ./modules/game.nix
            ./modules/user.nix
            ./modules/hypr.nix
            ./modules/AMD.nix
            (import ./hosts/atium/configuration.nix)
        ];
      };
    };
}
