{ lib, ... }: 

{
  services = {
    tlp = {
      enable = true;

      settings = { 
        CPU_BOOST_ON_BAT=0;
        CPU_HWP_DYN_BOOST_ON_BAT=0;

        START_CHARGE_THRESH_BAT0 = 80;
        START_CHARGE_THRESH_BAT1 = 85;
        STOP_CHARGE_THRESH_BAT0 = 85;
        STOP_CHARGE_THRESH_BAT1 = 90; 
      };
    };

    power-profiles-daemon.enable = lib.mkForce false;
  };
}