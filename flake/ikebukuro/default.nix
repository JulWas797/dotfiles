{ inputs, self, ... }:

inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit inputs self;
  };

  modules = [
    ../../hosts/ikebukuro
    ../../modules/base/shared
    ../../modules/base/ikebukuro
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x230
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

        users.jwas = ../../homes/ikebukuro;
      };
    }
  ];
}
