{ lib, config, ... }: 

{
  options.modules.tuned.enable = lib.mkEnableOption "Enable tuneD";

  config = lib.mkIf config.modules.tuned.enable {
    services.tuned = {
      enable = true;

      ppdSettings = {
        main.battery_detection = true;

        battery = {
          power-saver = "laptop-battery-powersave";
          balanced = "balanced-battery";
          performance = "throughput-performance";
        };
      };
    };
  };
}