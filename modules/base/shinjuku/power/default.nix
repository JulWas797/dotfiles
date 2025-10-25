{ lib, config, ... }: 

{
  options.modules.power.enable = lib.mkEnableOption "Enable power management";

  config = lib.mkIf config.modules.power.enable {
    services = {
      tlp = {
        enable = true;

        settings = { 
          CPU_DRIVER_OPMODE_ON_AC = "active";
          CPU_DRIVER_OPMODE_ON_BAT = "active";

          CPU_SCALING_GOVERNOR_ON_AC = "performance";
          CPU_SCALING_GOVERNOR_ON_BAT = "powersave"; 

          CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
          CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

          CPU_MIN_PERF_ON_AC = 0;
          CPU_MAX_PERF_ON_AC = 100;
          CPU_MIN_PERF_ON_BAT = 0;
          CPU_MAX_PERF_ON_BAT = 50;

          CPU_BOOST_ON_AC = 1;
          CPU_BOOST_ON_BAT = 0;

          CPU_HWP_DYN_BOOST_ON_AC = 1;
          CPU_HWP_DYN_BOOST_ON_BAT = 0;

          NMI_WATCHDOG = 0;

          DISK_APM_LEVEL_ON_AC = "254 254";
          DISK_APM_LEVEL_ON_BAT = "1 1";

          INTEL_GPU_MIN_FREQ_ON_AC = 300;
          INTEL_GPU_MIN_FREQ_ON_BAT = 300;
          INTEL_GPU_MAX_FREQ_ON_AC = 1100;
          INTEL_GPU_MAX_FREQ_ON_BAT = 800;
          INTEL_GPU_BOOST_FREQ_ON_AC = 1100;
          INTEL_GPU_BOOST_FREQ_ON_BAT = 800;

          SOUND_POWER_SAVE_ON_AC = 1;
          SOUND_POWER_SAVE_ON_BAT = 1;

          START_CHARGE_THRESH_BAT0 = 75;
          STOP_CHARGE_THRESH_BAT0 = 85;

          START_CHARGE_THRESH_BAT1 = 80;
          STOP_CHARGE_THRESH_BAT1 = 90; 
        };
      };

      power-profiles-daemon.enable = lib.mkForce false;

      throttled.enable = true;
    };
  };
}