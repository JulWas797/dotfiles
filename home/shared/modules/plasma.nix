{ pkgs, ... }:

{
  programs.plasma = {
    enable = true;

    fonts.fixedWidth = {
      family = "FiraCode Nerd Font Mono";
      pointSize = 10;
    };

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      iconTheme = "Breeze-Dark";

      cursor = {
        theme = "breeze_cursors";
        size = 24;
      };
    };

    configFile = {
      "kwinrc"."TabBox"."LayoutName" = "flipswitch";
    };
  };

  gtk = {
    enable = true;

    theme = {
      name = "Breeze";
      package = pkgs.kdePackages.breeze-gtk;
    };
  };
}
