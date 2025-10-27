{ lib, config, pkgs, ... }:

{
  options.modules.sddm = {
    enable = lib.mkEnableOption "Enable SDDM";

    scale = lib.mkOption {
      type = lib.types.str;
      default = "1.25";
      description = "Set QT_SCREEN_SCALE_FACTORS";
    };

    dpi = lib.mkOption {
      type = lib.types.str;
      default = "120";
      description = "Set QT_FONT_DPI";
    };
  };

  config = lib.mkIf config.modules.sddm.enable {
    services.displayManager.sddm = {
      enable = true;
      enableHidpi = true;
      wayland.enable = true;

      settings = {
        General.GreeterEnvironment = "QT_SCREEN_SCALE_FACTORS=${config.modules.sddm.scale},QT_FONT_DPI=${config.modules.sddm.dpi}";

        Theme = {
          CursorTheme = "breeze_cursors";
          CursorSize = 30;
        };
      };
    };

    environment.systemPackages = [
      (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
        [General]
        background=${./resources/lockscreen.jpg}
      '')
    ];
  };
}