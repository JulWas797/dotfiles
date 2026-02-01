{ inputs, self, ... }:

inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit inputs self;
  };

  modules = [
    ../../hosts/nyanix
    ../../modules/base/shared
    ../../modules/base/nyanix
    inputs.home-manager.nixosModules.home-manager
    inputs.sops-nix.nixosModules.sops

    {      
      nixpkgs.overlays = [ inputs.nix-vscode-extensions.overlays.default ];

      home-manager = {
        extraSpecialArgs = {
          inherit inputs self;
        };

        useGlobalPkgs = true;
        useUserPackages = true;

        sharedModules = [
          inputs.plasma-manager.homeModules.plasma-manager
          inputs.sops-nix.homeManagerModules.sops
        ];

        users.jwas = ../../homes/nyanix;
      };
    }
  ];
}
