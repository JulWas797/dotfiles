{ lib, ... }: 

{
  services = {
    tlp = {
      enable = true;

      settings = { 
        START_CHARGE_THRESH_BAT0 = 80;
        START_CHARGE_THRESH_BAT1 = 85;
        STOP_CHARGE_THRESH_BAT0 = 85;
        STOP_CHARGE_THRESH_BAT1 = 90; 
      };
    };

    power-profiles-daemon.enable = lib.mkForce false;
  };
}