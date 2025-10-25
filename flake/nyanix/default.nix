{ inputs, self, ... }:

inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit inputs self;
  };

  modules = [
    ../../modules/base/shared
    ../../modules/base/nyanix
    inputs.home-manager.nixosModules.home-manager
    
    {
      home-manager = {
        nixpkgs.overlays = [ inputs.nix-vscode-extensions.overlays.default ];

        extraSpecialArgs = {
          inherit inputs self;
        };

        useGlobalPkgs = true;
        useUserPackages = true;

        sharedModules = [
          inputs.plasma-manager.homeModules.plasma-manager
        ];

        users.jwas = ../../homes/jwas;
      };
    }
  ];
}