{ ... }:

{
  services.displayManager.sddm.settings = {
    General.GreeterEnvironment = "QT_SCREEN_SCALE_FACTORS=1.25,QT_FONT_DPI=120";
    
    Theme = {
      CursorTheme = "breeze_cursors";
      CursorSize = 30;
    };
  };
}