{
  description = "Flakie :3 (NEW: No longer monolythic)";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";

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

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      plasma-manager,
      nix-vscode-extensions,
      ...
    }:

    {
      nixosConfigurations = {

        nyanix = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ./hosts/nyanix/configuration.nix

            home-manager.nixosModules.home-manager

            {
              nixpkgs.overlays = [
                nix-vscode-extensions.overlays.default
              ];

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.sharedModules = [
                plasma-manager.homeModules.plasma-manager
              ];

              home-manager.users.jwas = import ./home/nyanix/home.nix;
            }
          ];
        };
      };
  };
}
