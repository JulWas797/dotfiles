{ lib, config, pkgs, ... }:

{
  options.modules.kde.enable = lib.mkEnableOption "Enable KDE";

  config = lib.mkIf config.modules.kde.enable {
    services = {
      xserver.enable = false;
      desktopManager.plasma6.enable = true;
    };
    
    systemd.user.services."app-org.kde.kalendarac@autostart".enable = false; 

    environment.systemPackages = with pkgs; [
      kdePackages.isoimagewriter
      kdePackages.kate
      kdePackages.kcalc
      kdePackages.krdc
      kdePackages.okular
      kdePackages.partitionmanager
      kdePackages.yakuake
      haruna
    ];
  };
}