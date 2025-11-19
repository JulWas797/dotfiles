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

    {
      nixpkgs.overlays = [ inputs.nix-vscode-extensions.overlays.default ];

      home-manager = {
        extraSpecialArgs = {
          inherit inputs self;
        };

        useGlobalPkgs = true;
        useUserPackages = true;

        users.jwas = ../../homes/ikebukuro;
      };
    }
  ];
}
