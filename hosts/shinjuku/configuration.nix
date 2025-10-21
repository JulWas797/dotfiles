{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/audio.nix
    ./modules/sddm.nix
    ../shared/configuration.nix
  ];

  networking.hostName = "shinjuku";
}
