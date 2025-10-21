{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/audio.nix
    ../shared/configuration.nix
  ];

  networking.hostName = "shinjuku";
}
