{ lib, ... }: 

{
  services = {
    tlp = {
      enable = true;

      settings = { 
        NMI_WATCHDOG = 0;

        INTEL_GPU_MIN_FREQ_ON_AC = 300;
        INTEL_GPU_MIN_FREQ_ON_BAT = 300;
        INTEL_GPU_MAX_FREQ_ON_AC = 1100;
        INTEL_GPU_MAX_FREQ_ON_BAT = 300;
        INTEL_GPU_BOOST_FREQ_ON_AC = 1100;
        INTEL_GPU_BOOST_FREQ_ON_BAT = 300;

        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "low-power";

        CPU_DRIVER_OPMODE_ON_AC = "active";
        CPU_DRIVER_OPMODE_ON_BAT = "active";

        CPU_SCALING_GOVERNOR_ON_AC = "powersave";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave"; 

        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;

        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;

        START_CHARGE_THRESH_BAT0 = 80;
        START_CHARGE_THRESH_BAT1 = 85;
        STOP_CHARGE_THRESH_BAT0 = 85;
        STOP_CHARGE_THRESH_BAT1 = 90; 
      };
    };

    power-profiles-daemon.enable = lib.mkForce false;

    throttled.enable = true;
  };
}