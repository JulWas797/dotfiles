{ inputs, self, ... }:

inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit inputs self;
  };

  modules = [
    ../../hosts/akihabara
    ../../modules/base/shared
    ../../modules/base/akihabara
    inputs.nixos-hardware.nixosModules.common.gpu.amd
    inputs.sops-nix.nixosModules.sops
  ];
}
