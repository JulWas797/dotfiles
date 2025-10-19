{ ... }:

{
  programs.plasma = {
    enable = true;

    fonts.fixedWidth = {
      family = "FiraCode Nerd Font Mono";
      pointSize = 10;
    };

    configFile = {
      "kwinrc"."TabBox"."LayoutName" = "flipswitch";
    };
  };
}
