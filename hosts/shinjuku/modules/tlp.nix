{ lib, ... }: 

{
  services = {
    tlp = {
      enable = true;

      settings = { 
        ENERGY_PERF_POLICY_ON_BAT="power";

        CPU_BOOST_ON_BAT=0;
        CPU_HWP_DYN_BOOST_ON_BAT=0;

        NMI_WATCHDOG=0;

        INTEL_GPU_MIN_FREQ_ON_AC=300;
        INTEL_GPU_MIN_FREQ_ON_BAT=300;
        INTEL_GPU_MAX_FREQ_ON_AC=1100;
        INTEL_GPU_MAX_FREQ_ON_BAT=300;
        INTEL_GPU_BOOST_FREQ_ON_AC=1;
        INTEL_GPU_BOOST_FREQ_ON_BAT=0;

        WOL_DISABLE="Y";

        START_CHARGE_THRESH_BAT0 = 80;
        START_CHARGE_THRESH_BAT1 = 85;
        STOP_CHARGE_THRESH_BAT0 = 85;
        STOP_CHARGE_THRESH_BAT1 = 90; 
      };
    };

    power-profiles-daemon.enable = lib.mkForce false;
  };
}