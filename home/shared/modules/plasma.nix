{ pkgs, lib, ... }:

{
  programs.plasma = {
    enable = true;

    fonts.fixedWidth = {
      family = "FiraCode Nerd Font Mono";
      pointSize = 10;
    };

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      iconTheme = "breeze-dark";

      cursor = {
        theme = "breeze_cursors";
        size = 24;
      };
    };

    krunner.position = "center";

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

  home.activation = {
    cleangtk = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
      rm -f ~/.config/gtk-4.0/gtk.css
      rm -f ~/.config/gtk-4.0/settings.ini
      rm -f ~/.config/gtk-3.0/settings.ini
      rm -f ~/.gtkrc-2.0
    '';
  };
}
