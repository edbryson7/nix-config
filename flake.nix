{
  description = "Eddie Nix Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      disko,
    }:
    {
      lib = {
        mkFlakeOutput = f: nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed f;
      };

      formatter = self.lib.mkFlakeOutput (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);

      # imageScripts.puter = self.nixosConfigurations.puter.config.system.build.diskoImagesScript;
      # nixosConfigurations.hex =
      #   let
      #     username = "ebryson";
      #     hostname = "hex";
      #     specialargs = inputs // {
      #       inherit username hostname ;
      #     };
      #   in
      #   nixpkgs.lib.nixosSystem {
      #     inherit specialArgs;
      #     modules = [
      #       # TODO configuration.nix
      #     ];
      #   };

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
    };
}
