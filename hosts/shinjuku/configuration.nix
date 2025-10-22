{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/audio.nix
    ./modules/sddm.nix
    ../shared/configuration.nix
  ];

  boot.loader = {
    timeout = 0;
    systemd-boot.consoleMode = "auto";
  };
  
  services.thermald.enable = true;

  programs.plasma.workspace.wallpaper = "${./files/wallpaper.jpg}";

  networking.hostName = "shinjuku";
}
