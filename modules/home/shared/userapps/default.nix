{ lib, config, pkgs, ... }:

{
  options.modules.userapps.enable = lib.mkEnableOption "User apps";

  config = lib.mkIf config.modules.userapps.enable {
    home.packages = with pkgs; [
      ayugram-desktop
      btop
      imagemagick
    ];
  };
}