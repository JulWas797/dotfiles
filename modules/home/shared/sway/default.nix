{ lib, config, pkgs, ... }:

{
  options.modules.sway.enable = lib.mkEnableOption "SwayWM";

  config = lib.mkIf config.modules.sway.enable {
    wayland.windowManager.sway = {
      enable = true;
      checkConfig = false;

      config = {
        modifier = "Mod4";
        terminal = "foot";
        defaultWorkspace = "workspace number 1";
        gaps.inner = 5;
        window.titlebar = false;

        input."*".xkb_layout = "pl";
        output."*".bg = "${./resources/wallpaper.png} fill";

        window.commands = [
          {
            criteria.app_id = "^launcher$"; 
            command = "floating enable, sticky enable, resize set 30 ppt 60 ppt, border pixel 5";
          }
        ];

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
          "Mod4+d" = "exec 'foot -a launcher -e sway-launcher-desktop'";
          "Mod4+b" = "exec librewolf";
        };
      };
    };

    home.packages = [ pkgs.sway-launcher-desktop ]; 
  };
}
