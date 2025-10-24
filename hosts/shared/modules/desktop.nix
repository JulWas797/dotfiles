{ ... }:

{
  services = {
    displayManager.sddm = {
      enable = true;
      enableHidpi = true;
      wayland.enable = true;
    };

    xserver.enable = false;
    desktopManager.plasma6.enable = true;
  };

  systemd.user.services."app-org.kde.kalendarac@autostart".enable = false; 
}
