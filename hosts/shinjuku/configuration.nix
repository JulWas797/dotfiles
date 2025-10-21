{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/audio.nix
    ./modules/sddm.nix
    ../shared/configuration.nix
  ];

  services.thermald.enable = true;

  networking.hostName = "shinjuku";
}
