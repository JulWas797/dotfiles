{ lib, config, ... }:

{
  options.modules.sway.enable = lib.mkEnableOption "SwayWM";

  config = lib.mkIf config.modules.sway.enable {
    wayland.windowManager.sway = {
      enable = true;
      checkConfig = false;

      config = {
        modifier = "Mod4";
        gaps.inner = 5;
        window.titlebar = false;

        bars = lib.mkIf config.modules.waybar.enable [
          { 
            command = "waybar"; 
          }
        ];

        keybindings = lib.mkOptionDefault {
          "XF86MonBrightnessDown" = "exec light -U 10";
          "XF86MonBrightnessUp" = "exec light -A 10";
          "XF86AudioRaiseVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ +5%'";
          "XF86AudioLowerVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ -5%'";
          "XF86AudioMute" = "exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle";
          "XF86AudioMicMute" = "exec 'pactl set-source-mute @DEFAULT_SOURCE@ toggle";
          "Mod4+d" = "exec 'wmenu-run -n \"adbcbc\" -N \"103c48\" -s \"cad8d9\" -S \"184956\" -i'";
        };
      };
    };
  };
}
