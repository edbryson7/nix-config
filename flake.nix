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
      # nixosConfigurations.puter =
      #   let
      #     username = "ebryson";
      #     hostname = "puter";
      #     specialArgs = inputs // {
      #       inherit username hostname ;
      #     };
      #   in
      #   nixpkgs.lib.nixosSystem {
      #     inherit specialArgs;
      #     modules = [
      #       # TODO configuration.nix
      #     ];
      #   };

      nixosConfigurations.hex = nixpkgs.lib.nixosSystem {
        modules = [
          (import ./configuration.nix)
        ];
      };
    };
}
