{ lib, config, ... }:

{
  options.modules.plymouth.enable = lib.mkEnableOption "Enable Plymouth";

  config = lib.mkIf config.modules.plymouth.enable {
    boot = {
      consoleLogLevel = 0;
      initrd.verbose = false;

      plymouth = {
        enable = true;
        theme = "spinner";
      };

      kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "udev.log_priority=3"
        "rd.systemd.show_status=false"
        "rd.udev.log_level=3"
      ];
    };
  };
}
