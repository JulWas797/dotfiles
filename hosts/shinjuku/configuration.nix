{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/audio.nix
    ./modules/sddm.nix
    ./modules/power.nix
    ../shared/configuration.nix
  ];

  boot.loader = {
    timeout = 0;
    systemd-boot.consoleMode = "auto";
  };
    
  networking.hostName = "shinjuku";
}
