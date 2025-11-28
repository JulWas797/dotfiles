{ lib, config, pkgs, ... }:

{
  options.modules.plasma.enable = lib.mkEnableOption "Enable Plasma";

  config = lib.mkIf config.modules.plasma.enable {
    xdg.dataFile."color-schemes/TokyoNight.colors".source = 
      let
        tokyo-night-git = pkgs.fetchFromGitHub {
          owner = "Jayy-Dev";
          repo = "Plasma-Tokyo-Night";
          rev = "1f2f04a2ad7c343b5ca54e27fadfae861fdaf88b";
          hash = "sha256-EdlMULeyiwfXw8qL47oWejg0ODDWr5GgK2aFpbPj+eM=";
        };
      in 
    "${tokyo-night-git}/colorscheme/TokyoNight.colors";

    programs.plasma = {
      enable = true;

      fonts.fixedWidth = {
        family = "FiraCode Nerd Font Mono";
        pointSize = 10;
      };

      workspace = {
        lookAndFeel = "org.kde.breezedark.desktop";
        iconTheme = "breeze-dark";
        colorScheme = "TokyoNight";

        cursor = {
          theme = "breeze_cursors";
          size = 24;
        };
      };

      krunner.position = "center";

      kscreenlocker.appearance.wallpaper = "${./resources/lockscreen.jpg}";

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

    home = {
      activation = {
        cleangtk = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
          rm -f ~/.config/gtk-4.0/gtk.css
          rm -f ~/.config/gtk-4.0/settings.ini
          rm -f ~/.config/gtk-3.0/settings.ini
          rm -f ~/.gtkrc-2.0
        '';
      };

      file =
        let 
          face = ./resources/.face;
        in 
      {
        ".face".source = face;
        ".face.icon".source = face;
      };
    };
  };
}
