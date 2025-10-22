{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/audio.nix
    ./modules/sddm.nix
    ./modules/tlp.nix
    ../shared/configuration.nix
  ];

  boot.loader = {
    timeout = 0;
    systemd-boot.consoleMode = "auto";
  };
  
  services.thermald.enable = true;

  networking.hostName = "shinjuku";
}
