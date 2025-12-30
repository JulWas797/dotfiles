{ inputs, self, ... }:

inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit inputs self;
  };

  modules = [
    ../../hosts/akihabara
    ../../modules/base/shared
    ../../modules/base/akihabara
    inputs.sops-nix.nixosModules.sops
  ];
}
