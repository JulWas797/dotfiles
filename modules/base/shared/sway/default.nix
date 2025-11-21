{ lib, config, pkgs, ... }: 

{
  options.modules.sway.enable = lib.mkEnableOption "Enable SwayWM";

  config = lib.mkIf config.modules.sway.enable {
    environment.systemPackages = with pkgs; [
      grim
      mako
      pavucontrol
      pcmanfm-qt
      slurp
      wl-clipboard      
      zathura
    ];

    fonts = {
      packages = with pkgs; [
        noto-fonts
        noto-fonts-emoji
        font-awesome
      ];

      fontconfig.defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
      };
    };

    programs = {
      light.enable = true;
      
      sway = {
        enable = true;
        wrapperFeatures.gtk = true;
      };
    };

    users.users.jwas.extraGroups = [ "video" ];

    security.polkit.enable = true;

    services.gnome.gnome-keyring.enable = true;
  };
}