{ inputs, self, ... }:

inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit inputs self;
  };

  modules = [
    ../../hosts/shinjuku
    ../../modules/base/shared
    ../../modules/base/shinjuku
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480
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

        users.jwas = ../../homes/shinjuku;
      };
    }
  ];
}