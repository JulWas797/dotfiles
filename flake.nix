{
  description = "Flakie :3 (NEW: No longer monolythic) (NEW 2: No longer messy)";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, ... } @ inputs: {
    nixosConfigurations = {
      nyanix = (import ./flake/nyanix) {inherit inputs self;};
      shinjuku = (import ./flake/shinjuku) {inherit inputs self;};
      ikebukuro = (import ./flake/ikebukuro) {inherit inputs self;};
    };
  };
}
