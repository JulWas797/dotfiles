{ lib, config, pkgs, ... }:

# TODO: MOVE OUT TO HOME MANAGER!
{
  options.modules.userapps.enable = lib.mkEnableOption "User apps";

  config = lib.mkIf config.modules.userapps.enable {
    environment.systemPackages = with pkgs; [
      ayugram-desktop
      btop
      imagemagick
      nixd
      onlyoffice-desktopeditors
    ];  
  };
}