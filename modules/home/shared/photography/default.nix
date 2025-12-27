{ lib, config, pkgs, ... }:

{
  options.modules.photography.enable = lib.mkEnableOption "Photography apps";

  config = lib.mkIf config.modules.photography.enable {
    home.packages = with pkgs; [
      ansel
      exiftool
    ];
  };
}