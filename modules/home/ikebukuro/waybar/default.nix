{ lib, config, ... }:

{
  options.modules.waybar.enable = lib.mkEnableOption "Waybar";

  config = lib.mkIf config.modules.waybar.enable {
    programs.waybar = {
      enable = true;
      style = ./resources/style.css;

      settings.mainBar = {
        layer = "top";
        position = "top";
        height = 27;
      
        modules-left = [ 
          "sway/workspaces" 
          "sway/scratchpad" 
          "sway/mode" 
          "sway/window" 
        ];

        modules-center = [ ];

        modules-right = [ 
          "network" 
          "temperature" 
          "memory" 
          "backlight" 
          "pulseaudio" 
          "battery" 
          "clock" 
          "tray" 
        ];

        "sway/workspaces" = {
          disable-scroll = true;
          disable-markup = true;
          format = "{index}";
        };

        "sway/scratchpad" = {
          format= "{icon} {count}";
          show-empty= false;
          format-icons= [ "" "" ];
          tooltip= true;
          tooltip-format ="{app}: {title}";
        };

        "sway/window" = {
          format = "{}";
          max-length = 150;
        };

        "network" = {
          format-wifi = "  {essid}";
          format-disconnected = " Disconnected";
        };
        
        "temperature" = {
          format = "{icon} {temperatureC}°C";
          format-icons = [ "" ];
        };

        "memory" = {
          format = "  {}%";
        };

        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
        };

        "pulseaudio" = {
          format = "{icon} {volume}% {format_source}";
          format-muted = "  {format_source}";
          format-source = " {volume}%";
          format-source-muted = " ";

          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" " " ];
          };
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };

          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = [ " " " " " " " " " " ];
          tooltip-format = "{time} @ {power}W";
        };

        "clock" = {
          format = "<b>{:%H:%M}</b>";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "tray" = {
          icon-size = 18;
          spacing = 15;
        };
      };
    };
  }; 
}
