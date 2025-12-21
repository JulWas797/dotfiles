{ lib, config, pkgs, ... }: 

{
  options.modules.sway.enable = lib.mkEnableOption "Enable SwayWM";

  config = lib.mkIf config.modules.sway.enable {
    environment.systemPackages = with pkgs; [
      grim
      mako
      pavucontrol
      slurp
      wl-clipboard      
      zathura
    ];

    fonts.fontconfig.defaultFonts = {
      serif = [ "Noto Serif" ];
      sansSerif = [ "Noto Sans" ];
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