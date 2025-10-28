{ lib, config, pkgs, ... }:

{
  options.modules.tex.enable = lib.mkEnableOption "Enable TeX";

  config = lib.mkIf config.modules.tex.enable {
    home.packages = with pkgs; [
      texlive.scheme-small
      (if config.modules.plasma.enable then kile else texstudio)
    ];
  };
}