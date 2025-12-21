{ lib, config, pkgs, ... }:

{
  options.modules.torrenting.enable = lib.mkEnableOption "Torrenting";

  config = lib.mkIf config.modules.torrenting.enable {
    home.packages = with pkgs; [
      transmission_4-qt6
    ];
  };
}