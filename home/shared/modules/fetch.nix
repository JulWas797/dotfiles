{ ... }:

{
  programs = {
    fastfetch.enable = true;

    hyfetch = {
      enable = true;

      settings = {
        backend = "fastfetch";
        mode = "rgb";
        preset = "rainbow";
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
}
