{ lib, config, pkgs, ... }:

{
  options.modules.fonts.enable = lib.mkEnableOption "Default fonts";

  config = lib.mkIf config.modules.fonts.enable {
    fonts.packages = with pkgs; [
      corefonts
      font-awesome
      helvetica-neue-lt-std
      liberation_ttf
      nerd-fonts.fira-code
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      ubuntu-sans
      vista-fonts
    ];
  };
}