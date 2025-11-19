{ lib, config, pkgs, ... }: 

{
  options.modules.sway.enable = lib.mkEnableOption "Enable SwayWM";

  config = lib.mkIf config.modules.sway.enable {
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      font-awesome
    ];

    programs = {
      light.enable = true;
      sway.enable = true;
    };

    users.users.jwas.extraGroups = [ "video" ];

    security.polkit.enable = true;

    services.gnome.gnome-keyring.enable = true;
  };
}