{ lib, config, ... }:

{
  options.modules.fetch.enable = lib.mkEnableOption "Enable FastFetch & HyFetch :3";

  config = lib.mkIf config.modules.fetch.enable {
    programs = {
      fastfetch.enable = true;

      hyfetch = {
        enable = true;

        settings = {
          backend = "fastfetch";
          mode = "rgb";
          preset = "femboy";
          light_dark = "dark";
          lightness = 0.56;

          color_align = {
            mode = "horizontal";
            custom_colors = [ ];
            fore_back = null;
          };

          distro = null;
        };
      };
    };
  }; 
}