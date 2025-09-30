{ ... }:

{
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
}