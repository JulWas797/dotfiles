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

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      plasma-manager,
      nix-vscode-extensions,
      nixos-hardware,
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

              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;

                sharedModules = [
                  plasma-manager.homeModules.plasma-manager
                ];

                users.jwas = import ./home/shinjuku/home.nix;
              };
            }
          ];
        };

        shinjuku = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ./hosts/shinjuku/configuration.nix
            home-manager.nixosModules.home-manager
            nixos-hardware.nixosModules.lenovo-thinkpad-t480

            {
              nixpkgs.overlays = [
                nix-vscode-extensions.overlays.default
              ];

              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;

                sharedModules = [
                  plasma-manager.homeModules.plasma-manager
                ];

                users.jwas = import ./home/shinjuku/home.nix;
              };
            }
          ];
        };
      };
  };
}
