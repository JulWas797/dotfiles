{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/audio.nix
    ./modules/sddm.nix
    ../shared/configuration.nix
  ];

  boot.loader.timeout = 0;

  services.thermald.enable = true;

  networking.hostName = "shinjuku";
}
